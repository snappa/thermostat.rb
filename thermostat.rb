require 'net/http'
require 'uri'
require 'open-uri'
require 'pdp_constants'

# Some docs
class Thermostat

    def initialize(ip, user, passwd)
        @ip = ip
        @user = user
        @passwd = passwd
        @fetched = {}
        @sensors = []
    end

    def [](reading)
        return @fetched[reading]
    end

    def url
        return "http://#{@ip}"
    end

    def set_senors(*array)
        @sensors = array
        return self
    end

    def get_query_url
        query = ""
        for item in @sensors
            if query != ""
                query += "&"
            end
            query += "OID#{item.oid}="
        end
        query = url + "/get?" + query
    end

    def set_query_url(mod, value)
        query = "OID#{mod.oid}=#{value}"
        query = url + "/pdp?" + query + "&sumbit=Submit"
    end

    # Because of the timing issues with the thermostat we want to get all the data we can in one packet.
    def fetch_data()
        open(get_query_url, :http_basic_authentication => [@user, @passwd]) do |line|
            parse_data(line.read)
        end
        return self
    end

    def set_data(mod, value)
        unless mod.ro?
            open(set_query_url(mod, value), :http_basic_authentication => [@user, @passwd]) do |line|
                parse_data(line.read)
            end
        end
        return self
    end


    def parse_data(raw_data)
        results = raw_data.split('&')
        results.each do |r|
            (oid, value) = r.split('=')
            mod = lookup_oid(oid)
            if mod
                @fetched[mod] = mod[value]
            end
        end
    end

    def lookup_oid(oid)
        newid = oid.sub(/^OID/, '')
        @sensors.each do |s|
            if s.oid == newid
                return s
            end
        end
        return nil
    end

    def to_s
        s = ""
        @fetched.each do |k, v|
            s += "#{k.name}: #{v}\n"
        end
        return s
    end
end
