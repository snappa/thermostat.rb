module Proliphix
    # This is the basic encapsulation class for OIDs used by the Proliphix thermostat.
       
    class OID
        # Create a new OID.  It takes 5 parameters
        #  * name - some name you want to make up
        #  * oid - the oid that Proliphix uses in it's web service call
        #  * readonly - is the attribute read only (prevents us from 
        #    ever trying to do a set call
        #  * valuemap - if the return is fundamentally an enumeration, 
        #     provide a hash that we can map these to strings that make sense
        #  * scale - degrees are sent back as ints which are degrees * 10.  
        #    If scale is set to true these are automatically divided by 10 before
        #    returned so that you get the answer in degrees
        
        def initialize(name, oid, readonly, valuemap = nil, scale = true)
            @name = name
            @oid = oid
            @valuemap = valuemap
            @readonly = readonly
            @scale = scale
        end
        
        # return the oid of the item that is used in the proliphix web
        # service calls.  This is typically of the format '4.1.12' or
        # '4.5.2'
        def oid
            return @oid
        end

        # return the name which you've provided.  This should be a basic string.
        def name
            return @name
        end

        # is the data from the oid read only.
        def ro?
            return @readonly
        end

        # Make the OIDs act as their own translator for the values
        # that come out of the webservices interface.  This is done
        # via the array opperator because it's doable. 
        #
        # We more or less get the raw value or the value divided by
        # 10, as degrees come back as a 10x integer.
        def [](value)
            if @valuemap 
                return @valuemap[value.to_i]
            elsif @scale
                return value.to_i / 10.0
            else
                return value.to_i
            end
        end
    end
end
