class Airplane

  attr_accessor :speed, :boarding_time, :pop
  attr_reader :from, :to

  def initialize(from, to, speed, boarding_time, pop)
    @from = from
    @to = to
    @speed = speed
    @boarding_time = boarding_time
    @pop = pop
  end

  def distance

  def apply_wind(