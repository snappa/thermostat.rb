module Proliphix
    # This is the core networking module for getting data off the
    # thermostat.  It looks sort of funny because I am reusing
    # constants as hash keys which are actually objects.
    # 
    
    class Network
        def initialize(ip, user, passwd)
            @ip = ip
            @user = user
            @passwd = passwd
            @last = Time.now.to_i
            @fetched = {}
            @sensors = [
                        ThermHvacMode,
                        ThermHvacState,
                        ThermFanMode,
                        ThermFanState,
                        ThermSetbackHeat,
                        ThermSetbackCool,
                        ThermHeat1Usage,
                        ThermCool1Usage,
                        ThermFanUsage,
                        ThermAverageTemp
                       ]
        end
      
        
        def [](reading)
            return @fetched[reading]
        end

        def get(name)
            if self[name] and up_to_date
                return self[name]
            else
                fetch_data
                # TODO: what if we don't manage to return values
                return self[name]
            end
        end
                  
        def set(name, value)
            set_data(name, value)
        end
        
        private 
        
        # Are we currently up to date with our data, if so don't worry
        # about getting any other values.
        def up_to_date 
            return (@last + 60) > Time.now.to_i
        end
        
        def url
            return "http://#{@ip}"
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
        
        # Because of the timing issues with the thermostat we want to
        # get all the data we can in one packet.
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
        
        # The return for the data from Proliphix is kind of silly.  It
        # includes oids = values in what looks like a uri string.  So
        # split twice to get values.
        def parse_data(raw_data)
            results = raw_data.split('&')
            results.each do |r|
                (oid, value) = r.split('=')
                mod = lookup_oid(oid)
                if mod
                    @fetched[mod] = mod[value]
                end
            end
            @last = Time.now.to_i
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
        

    end
end
