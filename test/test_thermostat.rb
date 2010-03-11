require File.dirname(__FILE__) + '/test_helper.rb'

class TestThermostat < Test::Unit::TestCase
    include Proliphix
    
    def setup
        @@t = Thermostat.new("foo", "me", "go")
        @@t.network.simulate = true
    end
    
    def test_scenario_one
        @@t.network.buffer = "OID4.1.1=2&OID4.1.2=3&OID4.1.3=1&OID4.1.4=2&OID4.1.5=690&OID4.1.6=760&OID4.5.1=87337&OID4.5.3=47835&OID4.5.5=36826&OID4.1.13=686&"
        
        assert_equal "Heat", @@t.mode
        assert_equal 68.6, @@t.temp
        assert_equal 69.0, @@t.heat_to
        assert_equal nil, @@t.cool_to
    end

    def test_scenario_two
        
    end
    
end
