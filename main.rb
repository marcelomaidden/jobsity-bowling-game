# frozen_string_literal: true

require_relative 'lib/file_utils'
require_relative 'lib/score'

file = FileReader.new('assets/game.txt', '.txt')
pinfalls = file.data
pinfalls.each_key do |player|
  score = Score.new(player, pinfalls[player])
end