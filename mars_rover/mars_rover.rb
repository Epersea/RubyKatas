class MarsRover

    CARDINAL_POINTS = ["N", "E", "S", "W"]

    def initialize(landing_zone)
        @landing_zone = landing_zone
        @position = to_dictionary(@landing_zone)
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

            if order == "R" || "L"
                rotate(order)
            end
        end
    end

    private

    def to_dictionary(zone)
        zone = zone.split(", ")
        zone_to_dictionary = {
            west_east: zone[0].to_i,
            south_north: zone[1].to_i,
            orientation: zone[2]
        }

        zone_to_dictionary
    end

    def move_forward
        if @position[:orientation] == "N"
            move_north
        elsif @position[:orientation] == "S"
            move_south
        elsif @position[:orientation] == "E"
            move_east
        elsif @position[:orientation] == "W"
            move_west
        end
    end

    def move_north
        @position[:south_north] += 1
    end

    def move_south
        @position[:south_north] -= 1
    end

    def move_east
        @position[:west_east] += 1
    end

    def move_west
        @position[:west_east] -= 1
    end

    def rotate(direction)
        cardinal_index = CARDINAL_POINTS.index(@position[:orientation])

        if direction == "R"
            !cardinal_index -= 3
        elsif direction == "L"
            !cardinal_index -= 1
        end

        @position[:orientation] = CARDINAL_POINTS[cardinal_index]
    end

end