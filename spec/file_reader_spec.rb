require_relative '../lib/file_reader'

RSpec.describe 'File reader' do
  let(:file) { FileReader.new('assets/game.txt') }
  let(:file2) { FileReader.new('assets/game2.txt') }
  let(:empty) { FileReader.new('empty.txt') }

  it "Returns an error message when the file doesn't exist" do
    expect(file2.error).to eq("File can't be read")
  end

  it 'Returns an Hash object with points for each player' do
    expect(file.data).to be_instance_of(Hash)
  end

  it 'Returns an empty Hash if the file is empty' do
    expect(empty.data).to be_instance_of(Hash)
  end
end
