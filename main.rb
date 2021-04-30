# frozen_string_literal: true

require_relative 'lib/file_reader'

file = FileReader.new('assets/game.txt')
file2 = FileReader.new('assets/game2.txt')
p file.data
p file2.error
