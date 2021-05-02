# Pinfalls class receive an array and groups the pinfalls
class Pinfalls
  attr_reader :data, :formatted

  def initialize(pinfalls)
    @data = pinfalls
    group_pinfalls
  end

  private

  def group_pinfalls
    grouped = []
    @formatted = []
    until @data.empty?
      @formatted.push(['', 'X'].join(' | ')) if @data[0] == '10'
      grouped.push([@data.shift]) if @data[0] == '10'
      next if @data[0] == '10'
      next if @data.empty?

      group = []
      total = 0
      2.times do
        value = @data.shift
        total += value.to_i
        group.push(value)
      end
      grouped.push(group)
      @formatted.push([group[0], '/'].join(' | ')) if total == 10
      @formatted.push(group.join(' | ')) unless total == 10
    end
    @data = grouped
  end
end
