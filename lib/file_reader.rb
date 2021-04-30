# frozen_string_literal: true

# FileReader reads game file and stores player names and points in an array
class FileReader
  attr_reader :data

  def initialize(filename)
    file = File.open(filename)
    @data = file.readlines.map(&:chomp)

  rescue
    @data = "File doesn't exist"
  end
end
