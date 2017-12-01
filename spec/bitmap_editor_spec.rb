require 'spec_helper'

describe BitmapEditor do
  subject(:bitmap_editor) { described_class.new.run(file)}

  context '#run' do
    context 'when no argument is used' do
      let(:file) { nil }
      it 'returns a message' do
        expect(STDOUT).to receive(:puts).with('please provide correct file')
        bitmap_editor
      end
    end

    context 'when the file does not exist' do
      let(:file) { '../examples/no_file.txt' }
      it 'returns a message' do
        expect(STDOUT).to receive(:puts).with('please provide correct file')
        bitmap_editor
      end
    end
  end


end