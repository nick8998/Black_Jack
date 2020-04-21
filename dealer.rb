class Dealer < Player

  attr_accessor :cards, :points, :bank, :number_card


  def initialize(name)
    super
  end
  
  def step
    if points < 17
      true
    else
      false  
    end
  end
end
