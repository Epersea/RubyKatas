require_relative '../mars_rover'
RSpec.describe MarsRover do

    it 'knows its landing zone' do
        landing_zone = '5, 5, N'
        mars_rover = MarsRover.new(landing_zone)

        expect(mars_rover.position).to eq(landing_zone)
    end

    it 'knows how to move forward' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.execute('MMM')

        final_position = '1, 5, N'
        expect(mars_rover.position).to eq(final_position)
    end

    it 'knows how to turn right' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.execute('R')

        final_position = '1, 2, E'
        expect(mars_rover.position).to eq(final_position)
    end

    it 'knows how to turn left' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.execute('L')

        final_position = '1, 2, W'
        expect(mars_rover.position).to eq(final_position)
    end

    it 'moves in the right direction after turning right' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.execute('RM')

        final_position = '2, 2, E'
        expect(mars_rover.position).to eq(final_position)
    end

    it 'executes complex commands' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.execute('RMMLLM')

        final_position = '2, 2, W'
        expect(mars_rover.position).to eq(final_position)
    end
end