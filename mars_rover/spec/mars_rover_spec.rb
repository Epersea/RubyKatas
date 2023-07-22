require_relative '../mars_rover'
RSpec.describe MarsRover do

    it 'knows its landing position' do
        landing_zone = '5, 5, N'
        mars_rover = MarsRover.new(landing_zone)

        expect(mars_rover.landing_zone).to eq(landing_zone)
    end
end