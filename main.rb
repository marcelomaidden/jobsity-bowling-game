require_relative 'lib/file_reader'

file = FileReader.new('assets/game.txt')
p file.data
