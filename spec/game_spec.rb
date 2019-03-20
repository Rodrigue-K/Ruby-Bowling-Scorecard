require 'game'

describe Game do
  subject(:game) { described_class.new }
  describe '#score' do
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

    context 'mediocre game' do
      let(:rolls) { [3] * 20 }
      it 'returns a score of 60' do
        rolls.each do |r| 
          game.roll(r)
        end
        expect(game.score).to eq(60)
      end
    end

    context 'mixed bag' do
      let(:rolls) { [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6] }
      it 'returns a score of 133' do
        rolls.each do |r| 
          game.roll(r)
        end
        expect(game.score).to eq(133)
      end
    end
  end 

  describe "#completed?" do
    context "for a strike in the 10th frame" do
      let(:rolls) { [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 10] }
      before do
        rolls.each { |r| game.roll(r) }
      end
  
      it "returns false" do  
        expect(game.completed?).to be false
      end
      
      it "returns true after playing the bonus rolls" do
        [10, 10].each { |r| game.roll(r) }
        expect(game.completed?).to be true
      end
    end
    
    context "for a spare in the 10th frame" do
      let(:rolls) { [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 5, 5] }
      it "returns false" do
        rolls.each { |r| game.roll(r) }
        expect(game.completed?).to be false
      end
    end
    
    context "for a completed game" do
      let(:rolls) { [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0] }
      
      it "returns true" do
        rolls.each { |r| game.roll(r) }
        expect(game.completed?).to be true
      end
    end        
    
    context "for an incomplete game" do
      let(:rolls) { [1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1] }
      it "returns false" do
        rolls.each { |r| game.roll(r) }
        expect(game.completed?).to be false
      end
    end
  end
end
