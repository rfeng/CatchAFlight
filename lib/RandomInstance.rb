require 'CatchAFlight'
require 'Calendar2'

def test_run
  options = {
              :num_ports => 300,
              :grid_size => [1000, 1000],
              :num_planes => 1000,
              :min_speed => 1,
              :max_speed => 1,
              :delay => Calendar2.new(3)
            }

  map = CatchAFlight.generate_map([], options)
  options[:num_planes].times do
    from, to = nil, nil
    from, to = map[(rand * options[:num_ports]).to_i], map[(rand * options[:num_ports]).to_i] while from == to
    from.create_plane(to, options[:min_speed], options[:delay])
  end

  cal = Calendar2.new
  planes_in_flight = []
  t = 0
  a = Time.new

  while t < 1000
    if (4 * (Time.new - a)).to_i > 0
      puts "t = #{t = cal.tic}"

      map.each do |port|
        port.planes.each do |plane|
          planes_in_flight << plane.take_off if t >= plane.boarding_time.time
        end
      end

      planes_in_flight.each do |plane|
        if (t - plane.boarding_time.time) * plane.speed >= plane.distance_to_travel
          plane.land 
          plane.to = map[rand * map.length] while plane.to == plane.from
          plane.boarding_time = Calendar2.new(t + options[:delay].time)
        end
      end

      a = Time.new
    end
  end
end

test_run
