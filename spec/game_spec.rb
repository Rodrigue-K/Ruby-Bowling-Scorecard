require 'game'
require 'game'

describe Game do
  subject(:game) { described_class.new }
  context 'Gutter game' do
    it 'returns a score of 0' do 
      20.times { game.roll(0) }
      expect(game.score).to eq(0)
    end 
  end 

  context 'perfect game' do 
    it 'returns a score of 300' do 
      12.times { game.roll(10) }
      expect(game.score).to eq(300)
    end
  end

  context 'mediocre' do
    let(:rolls) { [3] * 20 }
    it 'returns a score of 60' do
      rolls.each do |r| 
        game.roll(r)
      end
      expect(game.score).to eq(60)
    end
  end

  context 'mixed bag' do
    let(:rolls) { [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6] }
    it 'returns a score of 133' do
      rolls.each do |r| 
        game.roll(r)
      end
      expect(game.score).to eq(133)
    end
  end
end
