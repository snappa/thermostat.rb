require File.dirname(__FILE__) + '/test_helper.rb'

class TestThermostat < Test::Unit::TestCase
    include Proliphix
    
    def setup
        @@thermostat = Thermostat.new("foo", "me", "go")
    end
    
    def test_scenario_one
        @@values[ThermHvacMode] = 2
        @@values[ThermSetbackHeat] = 690
        @@values[ThermSetbackCool] = 790
        @@values[ThermAverageTemp] = 685
        
        assert_equal @@thermostat.mode, "Heat"
        assert_equal @@thermostat.temp, 68.5
        assert_equal @@thermostat.heat_to, 69.0
        assert_equal @@thermostat.cool_to, nil
    end

    def test_scenario_two
        
    end
    
end
