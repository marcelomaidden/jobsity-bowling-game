# Score class is used to calculate the player score based on pinfalls
class Score
  attr_reader :pinfalls, :total, :player

  def initialize(player, pinfalls)
    @player = player
    @pinfalls = pinfalls
    @total = []
    create_scores
  end

  private

  def strike?(index)
    return true if @pinfalls.data[index].length == 1 && @pinfalls.data[index][0].to_i == 10

    false
  end

  def strike(index)
    total = 10
    total += @total[index - 1] if index.positive?
    if @pinfalls.data[index + 1].length > 1
      @pinfalls.data[index + 1].each do |pinfalls|
        total += pinfalls.to_i
      end
      return total
    end
    total += 10 if strike?(index + 1)
    return total += 10 if strike?(index + 2)

    total += @pinfalls.data[index + 2][0].to_i
  end

  def spare?(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    return true if total == 10

    false
  end

  def spare(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    total += @pinfalls.data[index + 1][0].to_i if (index + 1) < 10
    total += @total[index - 1] if index.positive?
    total
  end

  def normal(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    total += @total[index - 1] if index.positive?
    total
  end

  def create_scores
    index = 0
    while index < 10
      if strike?(index)
        @total[index] = strike(index)
        index += 1
        next
      end
      if @pinfalls.data[index].length == 2
        @total[index] = spare(index) if spare?(index)
        @total[index] = normal(index) unless spare?(index)
      end
      index += 1
    end
  end
end
