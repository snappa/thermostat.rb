module Proliphix
    require 'pdp/oid'
    require 'pdp/constants'
    require 'pdp/network'
    require 'temperature'
    
    class Thermostat
        
        def initialize(ip, user, passwd)
            @network = Proliphix::Network.new(ip, user, passwd)
        end

        def [](reading)
            return @network.get(reading)
        end

        def []=(reading, value)
            return @network.set(reading, value)
        end
        
        def mode
            self[ThermHvacMode]
        end
        
        def target_heat
            case mode
                when "Heat" then return self[ThermSetbackHeat]
                when "Auto" then return self[ThermSetbackHeat]
            end
            return nil
        end
      
        def target_cool
            case mode
                when "Cool" then return self[ThermSetbackCool]
                when "Auto" then return self[ThermSetbackCool]
            end
            return nil
        end

        
        def temp
            self[ThermAverageTemp]
        end
        
    end
end
