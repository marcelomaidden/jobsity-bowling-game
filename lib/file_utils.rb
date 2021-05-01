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
  end

  def check_file
    return false unless valid_extension?
    return false unless @error.nil?
    return false if @lines.empty?

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
    valid = File.extname(@filename) == @extension
    @error = 'Wrong file extension' unless valid
    valid
  end
end

# FileReader reads game file and stores player names and points in a Hash
class FileReader
  attr_reader :data

  def initialize(filename)
    @data = {}
    @filename = filename
    @validator = FileValidator.new(filename, '.txt')
    process_output if @validator.check_file
  end

  private

  def process_output
    file = File.open(@filename)
    @lines = file.readlines.map(&:chomp)

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
