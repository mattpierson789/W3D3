class Sphere 

    def initialize(radius, center)

        @radius = radius 
        @center = center``

    end 

    def volume 
        (4/3) * Math::PI * (@radius **3)
    end 

end 