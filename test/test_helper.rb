require 'stringio'
require 'test/unit'
require File.dirname(__FILE__) + '/../lib/thermostat'

@@values = {}
module Proliphix
    class Network
        def get(name)
            @@values[name]
        end
        
        def set(name, value)
            @@values[name] = value
        end
    end
end
