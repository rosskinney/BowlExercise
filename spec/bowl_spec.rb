require 'rubygems'
require 'bundler/setup'
require 'rspec'
require_relative '../bowl'

describe BowlingGame do
  let(:game) { BowlingGame.new }
  describe '.initialize' do
    it 'sets @rolls to an empty array' do
      expect(game.rolls).to eq([])
    end
  end
  describe '#score' do
    context 'when only gutter balls are thrown' do
      it "scores the game a 0 when only gutter balls are thrown" do
        20.times { game.roll(0) }

        expect(game.score).to eq(0)
      end
    end
    context 'when one pin is knocked down with each roll' do
      it 'scores the game as 20 when one pine is knocked down on each roll' do

        20.times { game.roll(1) }

        expect(game.score).to eq(20)
      end
    end
    context 'when a spare is thrown' do
      it 'records the frame score as 10 plus the number of pins knocked down in the next frame with the first ball' do
        3.times { game.roll(5) }
        17.times { game.roll(0) }

        expect(game.score).to eq(20)
      end
    end
  end
end