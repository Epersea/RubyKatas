class MarsRover

    CARDINAL_POINTS = ["N", "E", "S", "W"]

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = to_dictionary(@landing_zone)
    end

    def to_dictionary(zone)
        zone = zone.split(", ")
        zone_to_dictionary = {
            east_west: zone[0].to_i,
            north_south: zone[1].to_i,
            orientation: zone[2]
        }

        zone_to_dictionary
    end

    def position
        "#{@position[:east_west]}, #{@position[:north_south]}, #{@position[:orientation]}"
    end

    def execute(command)
        orders = command.split("")
        orders.each do |order|
            if order == "M"
                move_forward
            end

            if order == "R"
                rotate_right
            end

            if order == "L"
                rotate_left
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

    def rotate_right
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])
        cardinal_index = cardinal_index += 1
        if cardinal_index > 3
            cardinal_index = 0
        end
        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

    def rotate_left
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])
        cardinal_index = cardinal_index -= 1
        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

end