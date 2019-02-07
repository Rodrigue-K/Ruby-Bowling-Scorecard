require "frame"

describe Frame do 
  let(:frame) { described_class.new }

  describe "#roll" do
    it "records the amount of pins knocked down" do 
      frame.roll(5)
      expect(frame.score).to eq(5)
    end
  end 

  describe "#completed?" do 
    context "for a strike" do
      before { frame.roll(10) }
      
      it "returns true" do
        expect(frame.completed?).to eq(true)
      end
    end 
      
    context "for a spare" do
      before do 
        frame.roll(5)
        frame.roll(5)
      end 
      
      it "returns true" do 
        expect(frame.completed?).to eq(true)
      end 
    end
  end
end