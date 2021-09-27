# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  describe '#initialize' do
    context 'When a player is created' do
      subject(:player1) { described_class.new('X', 1, 'Andy') }
      it 'Assigns name correctly' do
        expect(player1.name).to eq('Andy')
      end
    end
  end
end
      
  