class Airport
  
  attr_accessor :name, :lat, :long, :planes

  def initialize(name, lat, long)
    @name = name
    @lat = lat
    @long = long
  end

  # PARAMS
  # dest (Airport): destination of Airplane
  # speed (int): number of grids plane moves in one "hour"
  # boarding_time (Time): when the plane will take off
  def create_plane(dest, speed = 1, boarding_time = Time.new)
    Airplane.new(self, dest, boarding_time)
  end



end
