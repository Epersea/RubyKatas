class MarsRover

    CARDINAL_POINTS = ["N", "E", "S", "W"]

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = operable_landing_zone(@landing_zone)
    end

    def operable_landing_zone(landing_zone)
        landing_zone = landing_zone.split(", ")
        operable_landing_zone = {
            east_west: landing_zone[0].to_i,
            north_south: landing_zone[1].to_i,
            orientation: landing_zone[2]
        }

        operable_landing_zone
    end

    def position
        "#{@position[:east_west]}, #{@position[:north_south]}, #{@position[:orientation]}"
    end

    def move(command)
        orders = command.split("")
        orders.each do |order|
            if order == "M"
                move_forward
            end

            if order == "R"
                move_right
            end

            if order == "L"
                move_left
            end
        end
    end

    def move_forward
        if @position[:orientation] == "N"
            @position[:north_south] += 1
        elsif @position[:orientation] == "S"
            @position[:north_south] -= 1
        elsif @position[:orientation] == "E"
            @position[:east_west] += 1
        elsif @position[:orientation] == "W"
            @position[:east_west] -= 1
        end
    end

    def move_right
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])
        cardinal_index = cardinal_index += 1
        if cardinal_index > 3
            cardinal_index = 0
        end
        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

    def move_left
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])
        cardinal_index = cardinal_index -= 1
        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

end