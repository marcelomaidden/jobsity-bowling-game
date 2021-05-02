require 'terminal-table'

class Game
  def initialize(data, score, pinfalls)
    @data = data
    @score = score
    @pinfalls = pinfalls
  end

  def output
    table = Terminal::Table.new do |t|
      t.add_row(['Frame', 1,2,3,4,5,6,7,8,9,10])
      t.add_separator
      @data.each_key do |player|
        player_score = @score.new(player, @pinfalls.new(@data[player]))
        t.add_row([player_score.player])
        t.add_separator
        t.add_row(['Pinfalls'].concat(player_score.pinfalls.formatted))
        t.add_separator
        t.add_row(['Score'].concat(player_score.total))
        t.add_separator
      end
    end
    puts table
  end
end