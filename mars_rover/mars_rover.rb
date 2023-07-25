class MarsRover

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
        end
    end

end