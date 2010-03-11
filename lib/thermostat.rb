$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# This is the main class for controlling the Proliphix Thermostat.
# You must first initialize it with the control point credentials
class Thermostat
    VERSION = '1.1.1'
        
    require 'pdp/oid'
    require 'pdp/constants'
    require 'pdp/network'
    
    attr :network
    
    include Proliphix
    
    # create a new thermostat object.  It needs
    #  * ip - the ip address of the thermostat, probably 192.168.1.2
    #  * user - the admin user for the thermostat
    #  * passwd - the admin passwd for the thermostat
    def initialize(ip, user, passwd)
        @network = Proliphix::Network.new(ip, user, passwd)
    end
    
    # Get a reading for a constant, returns raw values
    def [](reading)
        return @network.get(reading)
    end
    
    # Set a reading for a constant.
    def []=(reading, value)
        return @network.set(reading, value)
    end
    
    # Get the thermostat mode.  This will come back as one of "Off",
    # "Heat", "Cool", or "Auto".
    def mode
        self[ThermHvacMode]
    end
    
    # Return what temperature the thermostat is attempting to heat to.
    def heat_to
        case mode
        when "Heat" then return self[ThermSetbackHeat]
        when "Auto" then return self[ThermSetbackHeat]
        end
        return nil
    end
    
    # Return what temperature the thermostat is attempting to cool to.
    def cool_to
        case mode
        when "Cool" then return self[ThermSetbackCool]
        when "Auto" then return self[ThermSetbackCool]
        end
        return nil
    end
    
    # Return the current temperature reading on the thermostat
    def temp
        self[ThermAverageTemp]
    end

    # Set the target heat-to temperature.  The effects in non heating
    # mode aren't well defined.
    def heat_to=(value)
        value *= 10
        if (value > 500) and (value < 800)
            self[ThermSetbackHeat] = value.to_i
        end
        heat_to
    end

    # Set the target cool-to temperature.  The effects in non cooling
    # mode aren't well defined.
    def cool_to=(value)    
        value *= 10
        if (value > 600) and (value < 900)
            self[ThermSetbackCool] = value.to_i
        end
        cool_to
    end
    
    # Are we currently running the heat, returns a boolean
    def heating?
        self[ThermHvacState] == "Heat"
    end

    # Are we currently running the AC, returns a boolean
    def cooling?
        self[ThermHvacState] == "Cool"
    end

    # The number of minutes of active heating since last reset of the counters.  
    def heat_usage
        self[ThermHeat1Usage]
    end

    # The number of minutes of active cooling since last reset of the counters.  
    def cool_usage
        self[ThermCool1Usage]
    end
 
    # The number of minutes the fan was running since last reset of the counters. 
    def fan_usage
        self[ThermFanUsage]
    end
     
    # Is the fan currently on.  It doesn't matter why it's on, just
    # that it's on.
    def fan_on?
        self[ThermFanState] == "On"
    end

    # Turn the fan on
    def fan_on!
        self[ThermFanMode] = 2
        self[ThermFanState]
    end

    # Turn the fan off
    def fan_off!
        self[ThermFanMode] = 1
        self[ThermFanState]
    end
end



