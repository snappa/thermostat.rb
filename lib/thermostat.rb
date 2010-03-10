$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# order here is important

class Thermostat
    VERSION = "1.0.0"
    
    require 'pdp/oid'
    require 'pdp/constants'
    require 'pdp/network'
    
    include Proliphix
            
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
    
    def fan_on?
        self[ThermFanState] == "On"
    end
    
end


