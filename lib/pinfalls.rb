class Pinfalls
  attr_reader :data
  def initialize(pinfalls)
    @data = pinfalls
    group_pinfalls
  end

  private

  def group_pinfalls
    grouped = []
    until @data.empty?
      grouped.push([@data.shift]) if @data[0] == '10'
      next if @data[0] == '10'

      group = []
      2.times { group.push(@data.shift) }
      grouped.push(group)
    end
    @data = grouped
  end
end
