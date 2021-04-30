class FileReader
  attr_reader :data

  def initialize(filename)
    file = File.open(filename)
    @data = file.readlines.map(&:chomp)
  end
end