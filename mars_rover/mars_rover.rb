class MarsRover

    CARDINAL_POINTS = ["N", "E", "S", "W"]

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = to_dictionary(@landing_zone)
    end

    def to_dictionary(zone)
        zone = zone.split(", ")
        zone_to_dictionary = {
            west_east: zone[0].to_i,
            south_north: zone[1].to_i,
            orientation: zone[2]
        }

        zone_to_dictionary
    end

    def position
        "#{@position[:west_east]}, #{@position[:south_north]}, #{@position[:orientation]}"
    end

    def execute(command)
        orders = command.split("")
        orders.each do |order|
            if order == "M"
                move_forward
            end

            if order == "R"
                rotate("right")
            end

            if order == "L"
                rotate("left")
            end
        end
    end

    def move_forward
        if @position[:orientation] == "N"
            @position[:south_north] += 1
        elsif @position[:orientation] == "S"
            @position[:south_north] -= 1
        elsif @position[:orientation] == "E"
            @position[:west_east] += 1
        elsif @position[:orientation] == "W"
            @position[:west_east] -= 1
        end
    end

    def rotate(direction)
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])

        if direction == "right"
            cardinal_index = cardinal_index - 3
        elsif direction == "left"
            cardinal_index = cardinal_index - 1
        end

        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

end