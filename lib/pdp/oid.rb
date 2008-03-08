module Proliphix
    class OID
        def initialize(name, oid, readonly, valuemap = nil, scale = true)
            @name = name
            @oid = oid
            @valuemap = valuemap
            @readonly = readonly
            @scale = scale
        end
        
        def oid
            return @oid
        end

        def name
            return @name
        end

        def ro?
            return @readonly
        end

        # a little tricky, but not too bad.  Basically the access
        # gives us either the value off the value map, or the degrees
        # reading (as we always get degrees as 10x ints)

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
