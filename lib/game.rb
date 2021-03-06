# frozen_string_literal: true

require 'terminal-table'
require 'rainbow'
# Game class is responsible to output the player's score if no score errors
class Game
  def initialize(data, score, pinfalls)
    @data = data
    @score = score
    @pinfalls = pinfalls
  end

  def output
    table = Terminal::Table.new do |t|
      t.add_row([Rainbow('Frame').red, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
      t.add_separator
      @data.each_key do |player|
        player_score = @score.new(player, @pinfalls.new(@data[player]))
        if player_score.error
          puts Rainbow(player_score.error).red
        else
          t.add_row([Rainbow(player_score.player).blue.bright])
          t.add_separator
          t.add_row([Rainbow('Pinfalls').cyan].concat(player_score.pinfalls.formatted))
          t.add_separator
          t.add_row([Rainbow('Score').yellow].concat(player_score.total))
          t.add_separator
        end
      end
    end
    puts table
  end
end

