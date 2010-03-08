$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require "pdp/thermostat"

# order here is important

class Thermostat
    VERISON = '1.0.0'
    
    
    def initialize()
    end
   
    def temp
        
    end
    
    def fan
        
    end
end

