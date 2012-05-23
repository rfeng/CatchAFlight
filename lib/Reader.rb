class Reader

  attr_accessor :commands

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
