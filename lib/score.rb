class Score
  def initialize(player, pinfalls)
    @player = player
    @pinfalls = pinfalls
    @frames = []
    @total = []
    create_frames
    create_scores
    puts @total.join('  ')
  end

  private

  def strike?(index)
    return true if @frames[index].length == 1 && @frames[index][0].to_i == 10

    false
  end

  def strike(index)
    total = 10
    total += @total[index - 1] if index.positive?
    if @frames[index + 1].length > 1
      @frames[index + 1].each do |pinfalls|
        total += pinfalls.to_i
      end
      return total
    end
    total += 10 if strike?(index + 1)
    return total += 10 if strike?(index + 2)

    total += @frames[index + 2][0].to_i
  end

  def spare?(index)
    total = 0
    @frames[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    return true if total == 10

    false
  end

  def spare(index)
    total = 0
    @frames[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    total += @frames[index + 1][0].to_i if (index + 1) < 10
    total += @total[index - 1] if index.positive?
    total
  end

  def normal(index)
    total = 0
    @frames[index].each do |pinfalls|
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
      if @frames[index].length == 2
        @total[index] = spare(index) if spare?(index)
        @total[index] = normal(index) unless spare?(index)
      end
      index += 1
    end
  end

  def create_frames
    until @pinfalls.empty?
      if @pinfalls[0] == '10'
        @frames.push([@pinfalls.shift])
      else
        frame = []
        2.times { frame.push(@pinfalls.shift) }
        @frames.push(frame)
      end
    end
  end
end
