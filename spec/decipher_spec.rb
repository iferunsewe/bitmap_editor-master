require 'spec_helper'

describe Decipher do
  subject(:decipher) { described_class.new(line).choose_task }

  context 'choosing a task' do
    context 'when it is an unreconizable command' do
      let(:line){ 'A 5 6 J' }
      it 'returns statement' do
        expect(STDOUT).to receive(:puts).with('unrecognised command :(')
        decipher
      end
    end

  end
end
