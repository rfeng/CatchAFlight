require 'Airport'
require 'Airplane'
require 'Reader'
require 'Calendar'

class CatchAFlight

  attr_accessor :map, :cal

  def run(airports = [], options = {})
    cal = Calendar.new

    if airports.empty?
      if options.empty?
        map = generate_map
      else
        map = generate_map(airports, options)
      end
    else
      map = generate_map(airports)
    end

    generate_planes(map)
    
    cal.start
    simulate(map, cal)
  end

  def simulate(map, cal)
    planes_in_flight = []
    day = -1
    while true # main simulation loop
      t = cal.current_time

      if t.day > day
        day = t.day
        puts "Day #{day} started!"
      end

      map.each do |port|
        port.planes.each do |plane|
          planes_in_flight << plane.take_off if t.after(plane.boarding_time)
        end
      end

      planes_in_flight.each do |plane|
        plane.land if Calendar.subtract(t, plane.boarding_time) * plane.speed > plane.distance_to_travel
      end
    end
  end

  # Creates an array of Airports
  #
  # PARAMS
  # airports (Array): 
  # rand_options (Hash):
  #   :num_ports (int): Number of airports to generate
  #   :grid_size (Array): Array of 2 elements to be the size of the map airports are placed on
  # Returns the created array
  def self.generate_map(airports = [], rand_options = {:num_ports => 300, :grid_size => [1000, 1000]})
    ports = []

    if airports.empty?
      rand_options[:num_ports].times do |i|
        lat, long = (rand * rand_options[:grid_size][0]).to_i, (rand * rand_options[:grid_size][1]).to_i
        ports << Airport.new(i.to_s, lat, long)
      end
    else
      airports.each do |j|
        ports << Airport.new(j[0], j[1], j[2])
      end
    end

    return ports
  end

  def generate_planes(map, options = {:num_planes => 1000, :min_speed => 0, :max_speed => 1})
    options[:num_planes].times do |_|
      from, to = nil, nil
      from, to = map[rand * map.length], map[rand * map.length] while from == to
      from.create_plane(to, rand * (options[:max_speed] - options[:min_speed]) + options[:min_speed])
    end
  end

  def shortest_path(map, from, to)
    m = 1
    class PathNode
      attr_accessor :id, :previous, :m
    end

    class Node
      attr_accessor :id, :branches
    end

    nodes = []
    map.each do |port|
      branches = []
      port.planes.each do |plane|
        branches << [plane.to, plane.distance_to_travel / plane.speed]
      end
      nodes << Node.new(port, branches)
    end

    path_nodes = [PathNode.new(from, '_', 0)]
    m = 0
    dest = nil
    while dest.nil?
      m += 1
      path_nodes.each do |path_node|
        path_node.branches.each do |branch|
          if branch[0].id != path_node.previous && path_node.m + branch[1] == m
            path_nodes << PathNode.new(branch[0], path_node.name, m)
          end
        end
      end

      dest = dest_in(path_nodes, to)
    end

    path = []

    begin
      path << dest.id

      dest.previous.planes.each do |plane|
        path << plane if plane.to == dest.id
      end

      path_nodes.each do |path_node|
        dest = path_node if dest.previous == path_node.id
      end
    end while dest.previous != '_'
  end

  def dest_in(path_nodes, to)
    path_nodes.each do |path_node|
      return path_node if path_node.id == to
    end
    nil
  end
end
