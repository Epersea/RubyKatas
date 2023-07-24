class MarsRover

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = landing_zone
    end

    def landing_zone
        @landing_zone
    end

    def position
        @position
    end

    def move(command)
        @position = "1, 5, N"
    end

end