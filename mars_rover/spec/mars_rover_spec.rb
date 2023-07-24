require_relative '../mars_rover'
RSpec.describe MarsRover do

    it 'knows its landing zone' do
        landing_zone = '5, 5, N'
        mars_rover = MarsRover.new(landing_zone)

        expect(mars_rover.landing_zone).to eq(landing_zone)
    end

    it 'knows how to move forward' do
        landing_zone = '1, 2, N'
        mars_rover = MarsRover.new(landing_zone)

        mars_rover.move('MMM')

        final_position = '1, 5, N'
        expect(mars_rover.position).to_eq(final_position)
    end
end