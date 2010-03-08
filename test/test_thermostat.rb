require File.dirname(__FILE__) + '/test_helper.rb'

class TestThermostat < Test::Unit::TestCase
    include Proliphix
    
    def setup
        @@thermostat = Thermostat.new("foo", "me", "go")
    end
    
    def test_scenario_one
        @@values[ThermHvacMode] = "Heat"
        @@values[ThermSetbackHeat] = 69.0
        @@values[ThermSetbackCool] = 79.0
        @@values[ThermAverageTemp] = 68.5
        
        
        assert_equal @@thermostat.mode, "Heat"
        assert_equal @@thermostat.temp, 68.5
        assert_equal @@thermostat.target_heat, 69.0
        assert_equal @@thermostat.target_cool, nil
    end
    
    def test_truth
        assert true
    end
end
