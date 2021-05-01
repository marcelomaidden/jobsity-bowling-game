# frozen_string_literal: true

require_relative 'lib/file_utils'
require_relative 'lib/score'
require_relative 'lib/game'
file = FileReader.new(ARGV[0], '.txt', FileValidator)

if file.validator.error
  puts file.validator.error
else
  game = Game.new(file.data, Score)
  game.output
end
