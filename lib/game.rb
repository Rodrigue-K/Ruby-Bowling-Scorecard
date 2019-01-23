class Game
  
  def initialize
    @rolls = []
  end

  def roll(n)
    @rolls.push(n)
  end 

  def score
    @rolls.reduce(:+)
  end
end