class Reader

  attr_accessor :commands

  # Initializes the Reader class
  #
  # This class accepts user input to execute
  #   certain commands on the CatchAFlight module
  #
  # PARAMS
  # cmds (Hash): Some methods that should be run
  #              when called by a string that can
  #              be given by user input
  def initialize(cmds = {})
    @commands = cmds
  end

  # Console method
  def get
    input = ''

    while input != 'quit'
      if input == ''
      elsif !@commands[input].nil?
        CatchAFlight.send(@commands[input[0]], input[1])
      else
        puts 'Improper command'
      end

      print 'CatchAFlight: '
      input = gets.chomp.split
    end
    puts 'Hope you enjoyed your flight!'
  end
end
