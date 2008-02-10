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
    
    ThermSetbackCool = OID.new("thermSetbackCoo",
                               "4.1.6",
                               false)
    
    # only on the NT150, and the math won't really work on this now anyway
    ThermConfigHumidyCool = OID.new("thermConfigHumidityCool",
                                    "4.2.22",
                                    false)
    
    ThermSetbackStatus = OID.new("thermSetbackStatus",
                                 "4.1.9",
                                 false,
                                 {
                                     1 => "Normal",
                                     2 => "Hold",
                                     3 => "Override"
                                 })

    ThermCurrentPeriod = OID.new("thermCurrentPeriod",
                                 "4.1.10",
                                 true, # false, but the spec says writes are ignored
                                 {
                                     1 => "Morn",
                                     2 => "Day",
                                     3 => "Eve",
                                     4 => "Night",
                                 })

    ThermActivePeriod = OID.new("thermActivePeriod",
                                "4.1.12",
                                true,
                                { 
                                    1 => "Morn",
                                    2 => "Day",
                                    3 => "Eve",
                                    4 => "Night",
                                    5 => "Hold",
                                    6 => "Override"
                                })

    ThermCurrentClass = OID.new("thermCurrenClass",
                                "4.1.11",
                                true,
                                {
                                    1 => "In",
                                    2 => "Out",
                                    3 => "Away"
                                })
    
    ThermAverageTemp = OID.new("thermAverageTemp",
                               "4.1.13",
                               true)
    
    ThermHeat1Usage = OID.new("thermHeat1Usage",
                              "4.5.1",
                              true) # it says false, but that's just too hard for me to wrap my brain around

    ThermHeat2Usage = OID.new("thermHeat2Usage",
                              "4.5.2",
                              true) # it says false, but that's just too hard for me to wrap my brain around

    ThermCool1Usage = OID.new("thermCool1Usage",
                              "4.5.3",
                              true) # it says false, but that's just too hard for me to wrap my brain around

    ThermCool2Usage = OID.new("thermCool1Usage",
                              "4.5.4",
                              true) # it says false, but that's just too hard for me to wrap my brain around
    
    ThermFanUsage = OID.new("thermFanUsage",
                            "4.5.5",
                            true)

    ThermLastUsageReset = OID.new("thermLastUsageReset",
                                  "4.5.6",
                                  false) # we're going to have to be tricky about this one
    
end
