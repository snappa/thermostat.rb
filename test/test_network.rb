require File.dirname(__FILE__) + '/test_helper.rb'

class TestThermostatNetwork < Test::Unit::TestCase
    include Proliphix
    
    def setup
        @@t = Thermostat.new("foo", "me", "go")
        @@t.network.simulate = 1
    end

    def test_get
        base_query = "http://foo/get?OID4.1.1=&OID4.1.2=&OID4.1.3=&OID4.1.4=&OID4.1.5=&OID4.1.6=&OID4.5.1=&OID4.5.3=&OID4.5.5=&OID4.1.13="
        
        @@t.network.get(ThermSetbackHeat)
        assert_equal(base_query, @@t.network.query)

        @@t.cool_to
        assert_equal(base_query, @@t.network.query)

        @@t.temp
        assert_equal(base_query, @@t.network.query)
      
        @@t.fan_on?
        assert_equal(base_query, @@t.network.query)
    end
    
end
