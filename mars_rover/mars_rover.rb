class MarsRover

    def initialize(landing_zone)
        @landing_zone = landing_zone
    end

    def landing_zone
        @landing_zone
    end

    def move(command)
        initial_position = @landing_zone
        final_position = initial_position

        individual_orders = command
        individual_orders.each do |order|
            if order == 'M'
                final_position[1] += 1
            end
        end

        final_position.to_s
    end

end