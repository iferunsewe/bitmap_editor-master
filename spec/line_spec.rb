require 'spec_helper'

describe Line do
  subject(:line) { described_class.new(text) }

  context 'when the line is invalid' do
    context 'because the line does not start with a capital letter' do
      let(:text) { 'i 7 8 E'}

      it 'returns a reason for failure' do
        expect(line.reason_for_failure).to eq('The line does not begin with a capital letter')
      end
    end

    context 'because coordinates are not between correct range' do
      let(:text) { 'L 400 8 Y'}

      it 'returns a reason for failure' do
        expect(line.reason_for_failure).to eq('Coordinates are not between correct range')
      end
    end

    context 'because it is an unaccepted command' do
      let(:text) { 'R 34 8 Y'}

      it 'returns a reason for failure' do
        expect(line.reason_for_failure).to eq("#{text[0]} is an unrecognised command :(")
      end
    end

    context 'because it has an incorrect number of characters' do
      let(:text) { 'L 40 8 Y h'}

      it 'returns a reason for failure' do
        expect(line.reason_for_failure).to include('Wrong number of characters for task:')
      end
    end

    context 'because it has an incorrect number of coordinates' do
      let(:text) { 'L 40 8 78'}

      it 'returns a reason for failure' do
        expect(line.reason_for_failure).to include('Wrong number of coordinates for task:')
      end
    end
  end

  context 'when the line is valid' do
    let(:text) { 'I 4 5' }

    it 'returns a task' do
      expect(line.task).not_to be_empty
    end
  end
end
