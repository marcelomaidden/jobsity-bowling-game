# frozen_string_literal: true

# Score class is used to calculate the player score based on pinfalls
class Score
  attr_reader :pinfalls, :total, :player, :error

  def initialize(player, pinfalls)
    @player = player
    @pinfalls = pinfalls
    @total = []
    create_scores
  end

  def valid?
    return false if @total.any?('invalid')
    return false if @pinfalls.data.length > 12
    return false if pinfalls.data.length > 10 &&
                    @pinfalls.data[9][0] != '10'
    return false if @total.any?(&:negative?)
    return false if @pinfalls.data.length < 10

    true
  end

  private

  def strike?(index)
    return true if @pinfalls.data[index].length == 1 && @pinfalls.data[index][0].to_i == 10

    false
  end

  def invalid?(total)
    result = total == 'invalid' || total > 10
    @error = "Invalid score for #{@player}" if result
    result
  end

  def strike(index)
    total = 10
    total += @total[index - 1] if index.positive? && valid_score?(index)
    if @pinfalls.data[index + 1].length > 1
      subtotal = 0
      @pinfalls.data[index + 1].each do |pinfalls|
        subtotal == 'invalid' if pinfalls.to_i.negative?
        break if subtotal == 'invalid'

        subtotal += pinfalls.to_i
      end
      return 'invalid' if invalid?(subtotal)

      return total += subtotal
    end
    total += 10 if strike?(index + 1)
    return total += 10 if strike?(index + 2)

    total += @pinfalls.data[index + 2][0].to_i
    total
  end

  def spare?(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total += pinfalls.to_i
    end
    return true if total == 10

    false
  end

  def valid_score?(index)
    return false if @total[index - 1] == 'invalid'

    true
  end

  def spare(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total = 'invalid' if pinfalls.to_i.negative?
      return 'invalid' if invalid?(total)

      total += pinfalls.to_i
    end
    return 'invalid' if invalid?(total)

    total += @pinfalls.data[index + 1][0].to_i if (index + 1) < 10
    total += @total[index - 1] if index.positive? && valid_score?(index)
    total
  end

  def normal(index)
    total = 0
    @pinfalls.data[index].each do |pinfalls|
      total = 'invalid' if pinfalls.to_i.negative?
      return 'invalid' if invalid?(total)

      total += pinfalls.to_i
    end
    return 'invalid' if invalid?(total)

    total += @total[index - 1] if index.positive? && valid_score?(index)
    total
  end

  def invalid_score?
    return true if @pinfalls.data.length > 12
    return true if @pinfalls.data.length > 10 && @pinfalls.data[9][0] != '10'

    false
  end

  def create_scores
    index = 0
    return @error = "Invalid score for #{@player}" if invalid_score?

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
  rescue NoMethodError
    @error = "Invalid score for #{@player}"
  end
end
