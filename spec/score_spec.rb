# frozen_string_literal: true

require_relative '../lib/pinfalls'
require_relative '../lib/score'

RSpec.describe 'Score class' do
  let(:perfect) { Pinfalls.new(%w[10 10 10 10 10 10 10 10 10 10 10 10]) }

  it 'Calculates the perfect score' do
    score = Score.new('Marcelo', perfect)
    expect(score.total).to eq([30, 60, 90, 120, 150, 180, 210, 240, 270, 300])
  end
end
