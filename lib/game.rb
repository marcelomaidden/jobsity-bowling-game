require_relative 'pinfalls'

class Game
  def initialize(data, score)
    @data = data
    @score = score
  end

  def output
    puts "Frame #{[1,2,3,4,5,6,7,8,9,10].join("\t")}"
    @data.each_key do |player|
      pinfalls = Pinfalls.new(@data[player])
      player_score = @score.new(player, pinfalls)
      puts player_score.player
      puts "Pinfalls #{player_score.pinfalls.data.join("  ")}"
      puts "Score #{player_score.total.join("\t")}"
    end
  end
end