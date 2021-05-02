# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/AbcSize

require 'rainbow'
require_relative '../lib/file_utils'
require_relative '../lib/score'
require_relative '../lib/game'
require_relative '../lib/pinfalls'

def two_players_score
  result = "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------------+\n"
  result += "| #{Rainbow('Frame').red}    | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9     | 10   |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------------+\n"
  result += "| #{Rainbow('Jeff').blue.bright}     |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+------+-------+\n"
  result += "| #{Rainbow('Pinfalls').cyan} |  | X  | 7 | / | 9 | 0 |  | X  | 0 | 8 | 8 | / | F | 6 |  | X  |  | X  |  | X | 8 | 1 |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+------+-------+\n"
  result += "| #{Rainbow('Score').yellow}    | 20    | 39    | 48    | 66    | 74    | 84    | 90    | 120   | 148   | 167  |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------------+\n"
  result += "| #{Rainbow('John').blue.bright}     |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+------+-------+\n"
  result += "| #{Rainbow('Pinfalls').cyan} | 3 | / | 6 | 3 |  | X  | 8 | 1 |  | X  |  | X  | 9 | 0 | 7 | / | 4 | 4 |  | X | 9 | 0 |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+------+-------+\n"
  result += "| #{Rainbow('Score').yellow}    | 16    | 25    | 44    | 53    | 82    | 101   | 110   | 124   | 132   | 151  |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+--------------+\n"
  result += "+----------+--------------------------------------------------------------------------------------+\n"
  result
end

def zero_score
  result = "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
  result += "| #{Rainbow('Frame').red}    | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9     | 10    |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
  result += "| #{Rainbow('Carl').blue.bright}     |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
  result += "| #{Rainbow('Pinfalls').cyan} | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
  result += "| #{Rainbow('Score').yellow}    | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |\n"
  result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
  result += "+----------+-------------------------------------------------------------------------------+\n"
  result
end

def perfect_score
  result = "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
  result += "| #{Rainbow('Frame').red}    | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 10   |\n"
  result += "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
  result += "| #{Rainbow('Carl').blue.bright}     |\n"
  result += "+----------+------+------+------+------+------+------+------+------+------+------+------+------+\n"
  result += "| #{Rainbow('Pinfalls').cyan} |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |\n"
  result += "+----------+------+------+------+------+------+------+------+------+------+------+------+------+\n"
  result += "| #{Rainbow('Score').yellow}    | 30   | 60   | 90   | 120  | 150  | 180  | 210  | 240  | 270  | 300  |\n"
  result += "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
  result += "+----------+-----------------------------------------------------------------------------------+\n"
  result
end

RSpec.describe 'Game integration tests' do
  let(:zero) { FileReader.new('spec/zero_score.txt', '.txt', FileValidator) }
  let(:zero_result) { Game.new(zero.data, Score, Pinfalls) }
  let(:perfect) { FileReader.new('spec/perfect_score.txt', '.txt', FileValidator) }
  let(:perfect_result) { Game.new(perfect.data, Score, Pinfalls) }
  let(:two_players) { FileReader.new('assets/game.txt', '.txt', FileValidator) }
  let(:two_players_result) { Game.new(two_players.data, Score, Pinfalls) }

  it 'Returns a result for a two players game' do
    expect { two_players_result.output }.to output(two_players_score).to_stdout
  end

  it 'Returns an output for a zero score' do
    expect { zero_result.output }.to output(zero_score).to_stdout
  end

  it 'Returns an output for a perfect result' do
    expect { perfect_result.output }.to output(perfect_score).to_stdout
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/AbcSize
