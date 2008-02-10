require 'net/http'
require 'uri'
require 'open-uri'
require 'pdp_constants'

class Thermostat
    def initialize(ip, user, passwd)
        @ip = ip
        @user = user
        @passwd = passwd
        @fetched = {}
    end

    def url
        return "http://#{@ip}"
    end

    # Because of the timing issues with the thermostat we want to get all the data we can in one packet.
    def fetch_data(array)
        query = ""
        for item in array
            if query != ""
                query += "&"
            end
            query += "OID#{item.oid}="
        end
        query = url + "/get?" + query
        puts query
    end
end
