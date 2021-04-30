# frozen_string_literal: true

# FileReader reads game file and stores player names and points in an array
class FileReader
  attr_reader :data, :error

  def initialize(filename)
    file = File.open(filename)
    @data = file.readlines.map(&:chomp)
  rescue Errno::ENOENT
    @error = "File can't be read"
  end
end
