require_relative '../lib/file_reader'

RSpec.describe 'File reader' do
  let(:file) { FileReader.new('assets/game.txt') }
  let(:file2) { FileReader.new('assets/game2.txt') }
  let(:empty) { FileReader.new('empty.txt') }
  let(:wrong_extension) { FileReader.new('file.html') }

  it "Returns an error message when the file doesn't exist" do
    expect(file2.error).to eq("File can't be read")
  end
  it 'Returns an Hash object with points for each player' do
    expect(file.data).to be_instance_of(Hash)
  end
  it 'Returns an empty Hash if the file is empty' do
    expect(empty.data).to be_instance_of(Hash)
  end
  it 'Returns an empty Hash and an error when extension is not txt' do
    expect(wrong_extension.data).to be_instance_of(Hash)
    expect(wrong_extension.error).to eq('Wrong file extension')
  end
end

