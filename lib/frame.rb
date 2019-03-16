class Frame

  attr_reader :rolls, :number

  def initialize(number)
    @rolls = []
    @number = number
  end

  def roll(number_rolled)
    @rolls << number_rolled
  end 

  def score
    @rolls.sum
  end

  def strike?
    rolls.length == 1 && score == 10
  end

  def spare?
    rolls.length == 2 && score == 10
  end

  def completed?
    if @number < 10 
      @rolls.count == 2 || score == 10
    else
      @rolls.count == 2 && score < 10 || @rolls.count == 3      
    end
  end
end
