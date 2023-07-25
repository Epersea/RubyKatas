class MarsRover

    CARDINAL_POINTS = ["N", "E", "S", "W"]

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = operable_landing_zone
    end

    def operable_landing_zone
        @landing_zone = @landing_zone.split(", ")
        @landing_zone[0] = @landing_zone[0].to_i
        @landing_zone[1] = @landing_zone[1].to_i
        @landing_zone
    end

    def position
        @position.join(", ")
    end

    def move(command)
        orders = command.split("")
        orders.each do |order|
            if order == "M"
                @position[1] += 1
            end

            if order == "R"
                move_right
            end
        end
    end

    def move_right
        cardinal_index = CARDINAL_POINTS.index(@position[2])
        cardinal_index = cardinal_index += 1
        if cardinal_index > 3
            cardinal_index = 0
        end
        @position[2] = CARDINAL_POINTS[cardinal_index]
    end

end