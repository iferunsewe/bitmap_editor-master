require 'spec_helper'

describe Decipher do
  subject(:decipher) { described_class }

  context 'choosing a task' do
    subject(:choose_task) { decipher.choose_task(line) }

    let(:command_to_create_image){'I 5 6'}

    context 'when it is an unreconizable command' do
      let(:line){ 'A 5 6 J' }
      it 'returns statement' do
        expect(choose_task).to eq('unrecognised_command')
      end
    end

    context 'when it is create image' do
      let(:line){ command_to_create_image }
      it 'chooses the correct task' do
        expect(choose_task).to eq('create_image')
      end
    end

    context 'when it is colour a pixel' do
      let(:line) { 'L 1 3 A' }
      it 'chooses the correct task' do
        expect(choose_task).to eq('colour_pixel')
      end
    end

    context 'when it is colour a vertical' do
      let(:line) { 'V 2 3 6 W' }
      it 'chooses the correct task' do
        expect(choose_task).to eq('colour_vertical')
      end
    end

    context 'when it is colour a horizontal' do
      let(:line) { 'H 3 5 2 Z' }
      it 'chooses the correct task' do
        expect(choose_task).to eq('colour_horizontal')
      end
    end

    context 'when it is display image' do
      let(:line) { 'S' }
      it 'chooses the correct task' do
        expect(choose_task).to eq('display_image')
      end
    end

    context 'when it is clear image' do
      let(:line) { 'C' }
      it 'chooses the correct task' do
        expect(choose_task).to eq('clear_image')
      end
    end
  end
end
