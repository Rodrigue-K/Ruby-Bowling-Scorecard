require 'frame'

class Game
  attr_reader :frames
  
  def initialize
    @frames = []
  end

  def roll(n)
    frame = @frames.last

    if frame.nil? || frame.completed?
      frame = Frame.new
      @frames.push(frame)
    end

    frame.roll(n)
  end 

  def score
    @frame.score
  end
end