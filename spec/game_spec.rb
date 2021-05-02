# frozen_string_literal: true

require_relative '../lib/file_utils'
require_relative '../lib/score'
require_relative '../lib/game'
require_relative '../lib/pinfalls'

RSpec.describe 'Game integration tests' do
  let(:zero) { FileReader.new('spec/zero_score.txt', '.txt', FileValidator) }
  let(:zero_result) { Game.new(zero.data, Score, Pinfalls) }
  let(:perfect) { FileReader.new('spec/perfect_score.txt', '.txt', FileValidator) }
  let(:perfect_result) { Game.new(perfect.data, Score, Pinfalls) }

  it 'Returns an result with total 0' do
    result = "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
    result += "| Frame    | 1     | 2     | 3     | 4     | 5     | 6     | 7     | 8     | 9     | 10    |\n"
    result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
    result += "| Carl     |\n"
    result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
    result += "| Pinfalls | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |\n"
    result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
    result += "| Score    | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     | 0     |\n"
    result += "+----------+-------+-------+-------+-------+-------+-------+-------+-------+-------+-------+\n"
    result += "+----------+-------------------------------------------------------------------------------+\n"
    expect { zero_result.output }.to output(result).to_stdout
  end

  it 'Returns a perfect result' do
    result = "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
    result += "| Frame    | 1    | 2    | 3    | 4    | 5    | 6    | 7    | 8    | 9    | 10   |\n"
    result += "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
    result += "| Carl     |\n"
    result += "+----------+------+------+------+------+------+------+------+------+------+------+------+------+\n"
    result += "| Pinfalls |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |  | X |\n"
    result += "+----------+------+------+------+------+------+------+------+------+------+------+------+------+\n"
    result += "| Score    | 30   | 60   | 90   | 120  | 150  | 180  | 210  | 240  | 270  | 300  |\n"
    result += "+----------+------+------+------+------+------+------+------+------+------+--------------------+\n"
    result += "+----------+-----------------------------------------------------------------------------------+\n"
    expect { perfect_result.output }.to output(result).to_stdout
  end
end
