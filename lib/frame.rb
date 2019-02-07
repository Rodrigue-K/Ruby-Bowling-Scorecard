class Frame

  def initialize
    @rolls = []
  end

  def roll(n)
    @rolls << n
  end 

  def score
    @rolls.sum
  end

  def completed?
    @rolls.count == 2 || score == 10 
  end
  
end