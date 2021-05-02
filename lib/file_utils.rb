# frozen_string_literal: true

# FileValidator validates the file checking extension and file structure
class FileValidator
  attr_reader :error

  def initialize(filename, extension)
    @filename = filename
    @extension = extension
    if valid_extension?
      file = File.open(filename)
      @lines = file.readlines.map(&:chomp)
    end
  rescue Errno::ENOENT
    @error = "File can't be read"
  rescue TypeError
    @error = 'Please, provide a valid file name'
  end

  def check_file
    return false unless valid_extension?
    return false unless @error.nil?
    return false if empty?

    result = true
    values = []
    @lines.each do |line|
      info = line.split(' ')
      result &&= info.length == 2
      result &&= info[0].split.all?(/[a-zA-Z]/)
      values.push(info[1])
    end
    result
  rescue TypeError
    @error = 'Please, provide a valid file name'
  end

  private

  def empty?
    if @lines.empty?
      @error = 'Empty file'
      return true
    end
    false
  end

  def valid_extension?
    valid = File.extname(@filename) == @extension
    @error = 'Wrong file extension' unless valid
    valid
  rescue TypeError
    @error = 'Please, provide a valid file name'
  end
end

# FileReader reads game file and stores player names and points in a Hash
class FileReader
  attr_reader :data, :validator

  def initialize(filename, extension, validator)
    @data = {}
    @filename = filename
    @validator = validator.new(filename, extension)
    process_output if @validator.check_file
  end

  private

  def process_output
    file = File.open(@filename)
    @lines = file.readlines.map(&:chomp)

    @lines.each do |line|
      player_throws = line.split('  ')
      if @data[player_throws[0]]
        @data[player_throws[0]].push(player_throws[1])
      else
        @data[player_throws[0]] = [player_throws[1]]
      end
    end
  end
end

