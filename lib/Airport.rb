require 'Airplane'

class Airport
  
  attr_accessor :name, :lat, :long, :planes

  def initialize(name, lat, long)
    @name = name
    @lat = lat
    @long = long
    @planes = []
  end

  # Initializes a new Airplane with parameters PARAMS
  # Adds that plane to @planes
  #
  # PARAMS
  # dest (Airport): destination of Airplane
  # speed (int): number of grids plane moves in one "hour"
  # boarding_time (Time): when the plane will take off
  #
  # Returns the created Airplane object
  def create_plane(dest, speed, boarding_time)
    plane = Airplane.new(self, dest, speed, boarding_time)
    add(plane)
    return plane
  end

  def add(plane)
    @planes << plane
  end

  def remove(plane)
    @planes.delete(plane)
  end

  def to_s
    "Airport #{@name} @(#{@lat}, #{@long})"
  end
end
