class Calendar2

  attr_accessor :time

  def initialize(time = 0)
    @time = time
  end

  def tic(toc = 1)
    @time += toc
  end

  def to_s
    "Time: #{@time}"
  end

end
