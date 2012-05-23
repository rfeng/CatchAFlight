require 'Airport'

module CatchAFlight

  def create_map(airports = [], num_ports = 300, grid_size = [1000, 1000])
    ports = []

    if airports.nil?
      num_ports.times do |i|
        lat, long = (rand * grid_size[0]).to_i, (rand * grid_size[1]).to_i
        ports << Airport.new(i, lat, long)
      end
    else
      airports.each do |j|
        ports << Airport.new(j[0], j[1], j[2])
      end
    end

    ports
  end
        
end
