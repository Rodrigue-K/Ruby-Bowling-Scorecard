require_relative 'frame'

class Game
  attr_reader :frames
  
  def initialize
    @frames = []
  end

  def roll(n)
    current_frame.roll(n)
  end 

  def score
    @frames.reduce(0) { |memo, frame| memo + frame.score  }
  end

  def completed?
    @frames.count == 10 && @frames.last.completed? && @frames.last.score < 10 
  end

  private

  def current_frame
    frame = @frames.last

    if frame.nil? || frame.completed?
      frame = Frame.new
      @frames.push(frame)
    end

    frame
  end


end