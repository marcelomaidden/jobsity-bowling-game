# frozen_string_literal: true

# FileReader reads game file and stores player names and points in an array
class FileReader
  attr_reader :error, :data

  def initialize(filename)
    @data = {}
    file = File.open(filename)
    @lines = file.readlines.map(&:chomp)
    process_points
  rescue Errno::ENOENT
    @error = "File can't be read"
  end

  private

  def process_points
    @lines.each do |line|
      user_throws = line.split(' ')
      if @data[user_throws[0]]
        @data[user_throws[0]].push(user_throws[1])
      else
        @data[user_throws[0]] = [user_throws[1]]
      end
    end
  end
end
