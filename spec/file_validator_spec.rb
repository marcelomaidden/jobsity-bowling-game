# frozen_string_literal: true

require_relative '../lib/file_utils'

RSpec.describe 'File validator' do
  let(:file2) { FileValidator.new('assets/game2.txt', '.txt') }
  let(:empty) { FileValidator.new('spec/empty.txt', '.txt') }
  let(:wrong_extension) { FileValidator.new('spec/file.html', '.txt') }
  let(:wrong_structure) { FileValidator.new('spec/structure.txt', '.txt') }

  it "Returns an error message when the file doesn't exist" do
    expect(file2.error).to eq("File can't be read")
  end
  it 'Validates if the file is empty' do
    empty.check_file
    expect(empty.error).to be('Empty file')
  end
  it 'Returns an error when extension is not txt' do
    expect(wrong_extension.error).to eq('Wrong file extension')
  end
  it 'Checks the file structure' do
    expect(wrong_structure.check_file).to be(false)
  end
end
