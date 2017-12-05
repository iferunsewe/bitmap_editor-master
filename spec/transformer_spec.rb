require 'spec_helper'

describe Transformer do
  subject(:transformer) { described_class.new }

  context 'creating an image' do
    it 'returns an image' do
      transformer.create_image('I 5 6')
      expect(transformer.image).not_to be_empty
    end
  end

  context 'when an image has already been created' do
    before do
      transformer.create_image('I 5 6')
    end

    context 'colouring a pixel' do
      let(:x) { 2 }
      let(:y) { 5 }
      let(:colour) { 'R' }
      let(:line) {"L #{x} #{y} #{colour}"}
      it 'colours the correct pixel' do
        transformer.colour_pixel(line)
        expect(transformer.image[y - 1][x - 1]).to eq(colour)
      end
    end

    context 'colour a vertical' do
      let(:x) { 2 }
      let(:y1) { 1 }
      let(:y2) { 5 }
      let(:colour) { 'T' }
      let(:line) {"V #{x} #{y1} #{y2} #{colour}"}
      it 'colours a vertical' do
        transformer.colour_vertical(line)
        y1.upto(y2) do |y|
          expect(transformer.image[y - 1][x - 1]).to eq(colour)
        end
      end
    end

    context 'colour a horizontal' do
      let(:x1) { 2 }
      let(:x2) { 6 }
      let(:y) { 5 }
      let(:colour) { 'T' }
      let(:line) {"V #{x1} #{x2} #{y} #{colour}"}
      it 'colours a horizontal' do
        transformer.colour_horizontal(line)
        x1.upto(x2) do |x|
          expect(transformer.image[y - 1][x - 1]).to eq(colour)
        end
      end
    end

    context 'displaying an image' do
      it 'puts an image' do
        expect(STDOUT).to receive(:puts).with(transformer.image)
        transformer.display_image
      end
    end

    context 'clearing an image' do
      it 'clears an imaage' do
        transformer.clear_image
        expect(transformer.image).to be_empty
      end
    end
  end
end
