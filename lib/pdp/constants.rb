module Proliphix
    # a whole crap load of constants for the proliphix API

    # This is the user setable mode for what state the thermostat is
    # in.  This could be one of Off, Heat, Cool, or Auto.  These
    # really mean which setback values the thermostat is going to pay
    # attention to.  
    #
    # In Off, obviously, it ignores them all.  In Heat mode, it only
    # cares if you are below SetbackHeat.  In Cool mode, it only cares
    # if you are above SetbackCool.  In Auto mode it will both heat
    # and cool to keep within some target range.
    #
    # Unless you are storing great works of art, Auto mode is
    # overkill, and probably going to cost you a lot of money on
    # Spring and Fall days.
    ThermHvacMode = OID.new("HVAC Mode",
                            "4.1.1",
                            false,
                            {
                                1 => "Off",
                                2 => "Heat", 
                                3 => "Cool",
                                4 => "Auto",
                            })
    
    ThermHvacState = OID.new("HVAC State",
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

    ThermFanMode = OID.new("Fan Mode",
                           "4.1.3",
                           false,
                           {
                               1 => "Auto",
                               2 => "On",
                               3 => "Schedule",
                           })
    
    ThermFanState = OID.new("Fan State",
                            "4.1.4",
                            true,
                            {
                                0 => "Init",
                                1 => "Off",
                                2 => "On",
                            })
    
    ThermSetbackHeat = OID.new("Setback Heat",
                               "4.1.5",
                               false)
    
    ThermSetbackCool = OID.new("Setback Cool",
                               "4.1.6",
                               false)
    
    # only on the NT150, and the math won't really work on this now anyway
    ThermConfigHumidyCool = OID.new("thermConfigHumidityCool",
                                    "4.2.22",
                                    false)
    
    ThermSetbackStatus = OID.new("Setback Status",
                                 "4.1.9",
                                 false,
                                 {
                                     1 => "Normal",
                                     2 => "Hold",
                                     3 => "Override"
                                 })

    ThermCurrentPeriod = OID.new("Current Period",
                                 "4.1.10",
                                 true, # false, but the spec says writes are ignored
                                 {
                                     1 => "Morn",
                                     2 => "Day",
                                     3 => "Eve",
                                     4 => "Night",
                                 })

    ThermActivePeriod = OID.new("Activity Period",
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

    ThermCurrentClass = OID.new("Current Day Class",
                                "4.1.11",
                                true,
                                {
                                    1 => "In",
                                    2 => "Out",
                                    3 => "Away"
                                })
    
    ThermAverageTemp = OID.new("Temperature (degrees F)",
                               "4.1.13",
                               true)
    
    ThermHeat1Usage = OID.new("Heat Usage (minutes)",
                              "4.5.1",
                              true, nil, false) # it says false, but that's just too hard for me to wrap my brain around

    ThermHeat2Usage = OID.new("Heat 2 Usage (minutes)",
                              "4.5.2",
                              true, nil, false) # it says false, but that's just too hard for me to wrap my brain around

    ThermCool1Usage = OID.new("Cooling Usage (minutes)",
                              "4.5.3",
                              true, nil, false) # it says false, but that's just too hard for me to wrap my brain around

    ThermCool2Usage = OID.new("Cooling 2 Usage (minutes)",
                              "4.5.4",
                              true, nil, false) # it says false, but that's just too hard for me to wrap my brain around
    
    ThermFanUsage = OID.new("Fan Usage (minutes)",
                            "4.5.5",
                            true, nil, false)

    ThermLastUsageReset = OID.new("Last Usage Reset",
                                  "4.5.6",
                                  false, nil, false) # we're going to have to be tricky about this one
    
end
