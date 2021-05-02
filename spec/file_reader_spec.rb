# frozen_string_literal: true

require_relative '../lib/file_utils'

RSpec.describe 'File Reader' do
  let(:file) { FileReader.new('assets/game.txt', '.txt', FileValidator) }

  it 'Returns an Hash object with points for each player' do
    expect(file.data).to be_instance_of(Hash)
  end
end
