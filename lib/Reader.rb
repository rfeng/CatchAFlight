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
  def initialize(cmds)
    @commands = cmds
  end

  def get
    input = ''
    begin
      if input == ''
      elsif !@commands[input].nil?
        @commands[input]
      else
        puts 'Improper command'
        puts @commands
      end

      input = gets.chomp
    end while input != 'quit'

    puts 'Hope you enjoyed your flight!'

  end
end
