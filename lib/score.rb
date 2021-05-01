# Score class is used to calculate the player score based on pinfalls
class Score
  attr_reader :pinfalls, :total, :player

  def initialize(player, pinfalls)
    @player = player
    @pinfalls = pinfalls
    @total = []
    group_pinfalls
    create_scores
  end

  private

  def strike?(index)
    return true if @pinfalls[index].length == 1 && @pinfalls[index][0].to_i == 10

    false
  end

  def strike(index)
    total = 10
    total += @total[index - 1] if index.positive?
    if @pinfalls[index + 1].length > 1
      @pinfalls[index + 1].each do |pinfalls|
        total += pinfalls.to_i
      end
      return total
    end
    total += 10 if strike?(index + 1)
    return total += 10 if strike?(index + 2)

    total += @pinfalls[index + 2][0].to_i
  end

  def spare?(index)
    total = 0
    @pinfalls[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    return true if total == 10

    false
  end

  def spare(index)
    total = 0
    @pinfalls[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    total += @pinfalls[index + 1][0].to_i if (index + 1) < 10
    total += @total[index - 1] if index.positive?
    total
  end

  def normal(index)
    total = 0
    @pinfalls[index].each do |pinfalls|
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
      if @pinfalls[index].length == 2
        @total[index] = spare(index) if spare?(index)
        @total[index] = normal(index) unless spare?(index)
      end
      index += 1
    end
  end

  def group_pinfalls
    grouped = []
    until @pinfalls.empty?
      grouped.push([@pinfalls.shift]) if @pinfalls[0] == '10'
      unless @pinfalls[0] == '10'
        group = []
        2.times { group.push(@pinfalls.shift) }
        grouped.push(group)
      end
    end
    @pinfalls = grouped
  end
end
