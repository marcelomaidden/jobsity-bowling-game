# frozen_string_literal: true

require_relative 'lib/file_utils'
require_relative 'lib/score'

file = FileReader.new(ARGV[0], '.txt', FileValidator)
if file.validator.error
  puts file.validator.error
else
  pinfalls = file.data
  pinfalls.each_key do |player|
    score = Score.new(player, pinfalls[player])
  end
end
