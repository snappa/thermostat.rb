require File.dirname(__FILE__) + '/test_helper.rb'

require "pp"

class TestThermostat < Test::Unit::TestCase
    include Proliphix

    def test_oid_values
        assert_equal(68, ThermSetbackHeat[680])
        assert_equal(68.0, ThermSetbackHeat[680])

        assert_equal(68, ThermSetbackCool[680])
        assert_equal(68.0, ThermSetbackCool[680])

        assert_equal(68, ThermAverageTemp[680])
        assert_equal(68.0, ThermAverageTemp[680])
    end
    
end
