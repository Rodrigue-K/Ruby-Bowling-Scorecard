require "frame"

describe Frame do 
  let(:frame) { described_class.new(1) }

  describe "#initialize" do
    it "records the number of the frame" do
      expect(frame.number).to eq(1)
    end
  end

  describe "#roll" do
    it "records the amount of pins knocked down" do 
      frame.roll(5)
      expect(frame.score).to eq(5)
    end
  end 

  describe "#stike?" do 
    it "returns true for a strike" do 
      frame.roll(10)
      expect(frame.strike?).to eq(true)
    end
    it "returns false when not a strike" do 
      frame.roll(4)
      expect(frame.strike?).to eq(false)
    end 
  end 

  describe "#spare?" do 
    it "returns true for a spare" do 
      frame.roll(6)
      frame.roll(4)
      expect(frame.spare?).to eq(true)
    end
    it "returns false when not a strike" do 
      frame.roll(4)
      frame.roll(4)
      expect(frame.spare?).to eq(false)
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

    context "for a regular frame" do 
      before do
        frame.roll(2)
        frame.roll(3)
      end

      it "returns true" do
        expect(frame.completed?).to eq(true)
      end
    end
    context "for an incomplete frame" do
      before do
        frame.roll(1)
      end

      it "returns false" do
        expect(frame.completed?).to eq(false)
      end
    end

    context "for the 10th frame" do
      let(:frame) { described_class.new(10) }

      context "for a strike" do
        before { frame.roll(10) }
        
        it "returns false" do
          expect(frame.completed?).to eq(false)
        end

        it "returns true after the bonus rolls" do
          frame.roll(10)
          frame.roll(10)
          expect(frame.completed?).to eq(true)
        end
      end 
        
      context "for a spare" do
        before do 
          frame.roll(3)
          frame.roll(7)
        end 
        
        it "returns false" do 
          expect(frame.completed?).to eq(false)
        end 

        it "returns true after the bonus roll" do
          frame.roll(7)
          expect(frame.completed?).to eq(true)
        end
      end

      context "for a regular frame" do 
        before do
          frame.roll(2)
          frame.roll(3)
        end

        it "returns true" do
          expect(frame.completed?).to eq(true)
        end
      end
      context "for an incomplete frame" do
        before do
          frame.roll(1)
        end

        it "returns false" do
          expect(frame.completed?).to eq(false)
        end
      end
    end
  end
end