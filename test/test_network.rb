require File.dirname(__FILE__) + '/test_helper.rb'

class TestThermostatNetwork < Test::Unit::TestCase
    include Proliphix
    
    def squery
        @@t.network.squery
    end
    def query
        @@t.network.query
    end
    
    def setup
        @@t = Thermostat.new("foo", "me", "go")
        @@t.network.simulate = 1
        # this is some real data
        @@t.network.buffer = "OID4.1.1=2&OID4.1.2=3&OID4.1.3=1&OID4.1.4=2&OID4.1.5=690&OID4.1.6=760&OID4.5.1=87337&OID4.5.3=47835&OID4.5.5=36826&OID4.1.13=686&"
    end

    def test_get_query_generate
        base_query = "http://foo/get?OID4.1.1=&OID4.1.2=&OID4.1.3=&OID4.1.4=&OID4.1.5=&OID4.1.6=&OID4.5.1=&OID4.5.3=&OID4.5.5=&OID4.1.13="
        
        @@t.heat_to
        assert_equal(base_query, query)

        @@t.cool_to
        assert_equal(base_query, query)

        @@t.temp
        assert_equal(base_query, query)
      
        @@t.fan_on?
        assert_equal(base_query, query)
    end
    
    def test_set_query_generate
        @@t.heat_to = 68
        assert_equal("http://foo/pdp?OID4.1.5=680&sumbit=Submit", squery)
        
        @@t.heat_to = 68.0
        assert_equal("http://foo/pdp?OID4.1.5=680&sumbit=Submit", squery)

        @@t.heat_to = 68.01
        assert_equal("http://foo/pdp?OID4.1.5=680&sumbit=Submit", squery)

        @@t.heat_to = 68.095
        assert_equal("http://foo/pdp?OID4.1.5=680&sumbit=Submit", squery)


        @@t.cool_to = 76.5
        assert_equal("http://foo/pdp?OID4.1.6=765&sumbit=Submit", squery)

        @@t.cool_to = 76.51
        assert_equal("http://foo/pdp?OID4.1.6=765&sumbit=Submit", squery)

        @@t.cool_to = 76.519
        assert_equal("http://foo/pdp?OID4.1.6=765&sumbit=Submit", squery)

        @@t.fan_off!
        assert_equal("http://foo/pdp?OID4.1.3=1&sumbit=Submit", squery)

        @@t.fan_on!
        assert_equal("http://foo/pdp?OID4.1.3=2&sumbit=Submit", squery)
        
        @@t.network.squery = ""
      
        # we have some safety measures in here
        @@t.cool_to = 45
        assert_equal("", squery)

        @@t.cool_to = -100
        assert_equal("", squery)

        @@t.heat_to = 90
        assert_equal("", squery)
    end

end
