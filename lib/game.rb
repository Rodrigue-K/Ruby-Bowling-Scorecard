require_relative 'frame'

class Game
  attr_reader :frames, :frame_counter, :history
  
  def initialize
    @frames = []
    @frame_counter = 0
    @history = []
  end

  def roll(number_rolled)
    current_frame.roll(number_rolled)
    @history.push(number_rolled)
  end 

  def score
    bonus_total = 0 
    @frames.each do |frame|
      if frame.strike?
       bonus_total += @history[frame.number + 2]
      #  bonus_total += @history[frame.number + 2]
      elsif frame.spare?
      #  p bonus_total += @history[frame.number + 3]
        @history
      end
    end
    @frames.sum(&:score) + bonus_total
  end

  def completed?
    @frames.count == 10 && @frames.last.completed?
  end


  private

  def current_frame
    frame = @frames.last

    if frame.nil? || frame.completed?
      @frame_counter += 1 
      frame = Frame.new(@frame_counter)
      @frames.push(frame)
    end
    frame
  end

end
