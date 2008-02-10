require 'pdp_oid'

module Proliphix
    # a whole crap load of constants for the proliphix API

    # read/write
    ThermHvacMode = OID.new("thermHvacMode",
                            "4.1.1",
                            false,
                            {
                                1 => "Off",
                                2 => "Heat", 
                                3 => "Cool",
                                4 => "Auto",
                            })
    
    ThermHvacState = OID.new("thermHvacState",
                            "4.1.2",
                             true,
                            {
                                1 => "Initializing",
                                2 => "Off",
                                3 => "Heat",
                                4 => "Heat2",
                                5 => "Heat3",
                                6 => "Cool",
                                7 => "Cool2",
                                8 => "Delay", 
                                9 => "ResetRelays"
                            })

    ThermFanMode = OID.new("thermFanMode",
                           "4.1.3",
                           false,
                           {
                               1 => "Auto",
                               2 => "On",
                               3 => "Schedule",
                           })
    
    ThermFanState = OID.new("thermFanState",
                            "4.1.4",
                            true,
                            {
                                0 => "Init",
                                1 => "Off",
                                2 => "On",
                            })

    ThermSetbackHeat = OID.new("thermSetbackHeat",
                              "4.1.5",
                              false)
    
     


    ThermAvgTemp = "4.1.13"
    ThermSensorTemp1 = "4.3.2.1"
    ThermSensorTemp2 = "4.3.2.2"
    ThermSensorTemp3 = "4.3.2.3"
end
