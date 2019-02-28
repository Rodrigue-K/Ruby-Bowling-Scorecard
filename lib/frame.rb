class Frame

  attr_reader :rolls, :number

  def initialize(number)
    @rolls = []
    @number = number
  end

  def roll(n)
    @rolls << n
  end 

  def score
    @rolls.sum
  end

  def completed?
    if @number < 10 
      @rolls.count == 2 || score == 10
    else
      @rolls.count == 2 && score < 10 || @rolls.count == 3      
    end
  end
end