class Airplane

  attr_accessor :speed, :boarding_time, :pop, :from, :to

  def initialize(from, to, speed, boarding_time, pop = 0)
    @from = from
    @to = to
    @speed = speed
    @boarding_time = boarding_time
    @pop = pop
  end

  def distance_to_travel
    total_distance = Math::sqrt((to.lat - from.lat)**2 + (to.long - from.long)**2)
  end

  def take_off

    puts "Plane took off from #{@from.to_s} to #{@to.to_s}"

    @from.remove(self)
  end

  def land

    puts "Plane landed in #{@to.to_s}"

    @to.add(self)
    @from = @to
  end

  # PARAMS
  # w (Array): wind vector to slow plane
  #     w should be of form [x, y]
  def apply_wind(w)
    x_dist = to.long - from.long
    y_dist = to.lat - from.lat

    angle = Math::atan(y_dist / x_dist)
    (y_dist > 0 ? angle = Math::pi - angle : angle = -Math::pi - angle) if x_dist < 0

    new_x = @speed * Math::cos(angle) - w[0]
    new_y = @speed * Math::sin(angle) - w[1]
    @speed = Math::sqrt(new_x**2 + new_y**2)
  end

  def to_s
    output = ""
    output << "Airplane boarding at #{@from} "
    output << "bound for #{@to} "
    output << "to depart at #{@boarding_time.to_s}"
  end
end
