class Game
  def initialize(data, score)
    @data = data
    @score = score
  end

  def output
    puts "Frame #{[1,2,3,4,5,6,7,8,9,10].join("\t")}"
    @data.each_key do |player|
      player_score = @score.new(player, @data[player])
      puts player_score.player
      puts "Pinfalls #{player_score.frames.join("  ")}"
      puts "Score #{player_score.total.join("\t")}"
    end
  end
end