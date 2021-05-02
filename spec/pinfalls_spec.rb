# frozen_string_literal: true

require_relative '../lib/pinfalls'

RSpec.describe 'Pinfalls class' do
  let(:pinfalls) { Pinfalls.new(%w[10 10 10 10 10 10 10 10 10 10]) }

  it 'Returns an Array after processing' do
    expect(pinfalls.data).to be_instance_of(Array)
  end

  it 'Returns a formatted version of the array' do
    expect(pinfalls.formatted).to eq([' | X', ' | X', ' | X', ' | X', ' | X', ' | X', ' | X', ' | X', ' | X', ' | X'])
  end
end
