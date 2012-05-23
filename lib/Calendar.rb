

class Calendar

  attr_reader :day, :hour, :min, :sec

  def initialize(day = 0, hour = 0, min = 0, sec = 0)
    @day = day
    @hour = hour
    @min = min
    @sec = sec
    @start_time = 0
    @pauses = []
  end

  def start
    @start_time = Time.new
  end

  def restart
    @start_time = Time.new
    @pauses = []
  end

  def pause
    @pauses << [Time.new]
  end

  def unpause
    @pauses[@pauses.length-1] << Time.new
  end

  def current_time
    t = time_since_start

    day = ((t - @start_time) / 86400).to_i
    t -= day * 86400

    hour = ((t - @start_time) / 3600).to_i
    t -= hour * 3600

    min = ((t - @start_time) * 60).to_i
    t -= min * 60

    sec = (t - @start_time).to_i

    return Calendar.new(day, hour, min, sec)
  end

  def time_since_start
    t = Time.now
    total_pause = 0
    @pauses.each do |p|
      time_during = p[1] - p[0]
      total_pause += time_during
    end
    return t - total_pause
  end

  def after(other_cal)
    [:day, :hour, :min, :sec].each do |i|
      return true if self.send(i) > other_cal.send(i)
    end
    false
  end

  def self.subtract(cal1, cal2)
    result_cal = Calendar.new
    ['day', 'hour', 'min', 'sec'].each do |i|
      result_cal.send((i + '='), (cal1.send(i) - cal2.send(i)))
    return result_cal
  end

  def to_s
    str = ""
    str << "Day: " << self.day << "|"
    str << @hour << ":" << @mind << ":" << @sec.to_i
  end

  def to_sec
    self.day * 86400 + self.hour * 3600 + self.min * 60 + self.sec
  end
end
  
