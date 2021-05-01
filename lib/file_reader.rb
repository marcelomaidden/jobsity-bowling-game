# frozen_string_literal: true

# FileReader reads game file and stores player names and points in an array
class FileReader
  attr_reader :error, :data

  def initialize(filename)
    @data = {}
    @filename = filename
    @error = 'Wrong file extension' unless valid_extension?
    if valid_extension?
      file = File.open(filename)
      @lines = file.readlines.map(&:chomp)
      process_points
    end
  rescue Errno::ENOENT
    @error = "File can't be read"
  end

  def check_file
    return false unless valid_extension?
    return false unless @error.nil?
    return false if @data.empty?

    result = true
    @lines.each do |line|
      info = line.split(' ')
      result &&= info.length == 2
      result &&= info[0].split.all?(/[a-zA-Z]/)
    end
    result
  end

  private

  def valid_extension?
    File.extname(@filename) == '.txt'
  end

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
