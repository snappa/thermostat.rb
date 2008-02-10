class Proliphix
    # a whole crap load of constants for the proliphix API

    # read/write
    ThermHvacMode = "4.1.1" 
    ThermHvacModeValues = {
        1 => "Off",
        2 => "Heat", 
        3 => "Cool",
        4 => "Auto",
    }

    ThermHvacState = "4.1.2"
    ThermHvacStateValues = {
        1 => "Initializing",
        2 => "Off",
        3 => "Heat",
        4 => "Heat2",
        5 => "Heat3",
        6 => "Cool",
        7 => "Cool2",
        8 => "Delay", 
        9 => "ResetRelays"
    }

    ThermAvgTemp = "4.1.13"
    ThermSensorTemp1 = "4.3.2.1"
    ThermSensorTemp2 = "4.3.2.2"
    ThermSensorTemp3 = "4.3.2.3"
    ThermFanState = "4.1.4"
    

end
