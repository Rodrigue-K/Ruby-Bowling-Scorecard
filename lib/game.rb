require_relative 'frame'

class Game
  attr_reader :frames, :frame_counter
  
  def initialize
    @frames = []
    @frame_counter = 0
  end

  def roll(n)
    current_frame.roll(n)
  end 

  def score
    @frames.sum(&:score)
  end

  def completed?
    @frames.count == 10 && @frames.last.completed? && @frames.last.score < 10 
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