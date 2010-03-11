require File.dirname(__FILE__) + '/test_helper.rb'

require "pp"

class TestThermostat < Test::Unit::TestCase
    include Proliphix

    def test_therm
        puts ThermSetbackHeat[680]
    end
    
end
