require_relative '../lib/file_reader'

RSpec.describe 'Reads file' do
  let(:file) { FileReader.new('assets/game.txt') }
  let(:file2) { FileReader.new('assets/game2.txt') }

  it 'Return an array of players and their throws' do
    expect(file.data).to be_instance_of(Array)
  end

  it "Returns an error message when the file doesn't exist" do
    expect(file2.error).to eq("File can't be read")
  end
end
