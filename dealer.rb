class Dealer < Player

  attr_accessor :cards, :bank, :number_card


  def initialize(name)
    super
  end
  
  def step
    if @hand.points < 17
      true
    else
      false  
    end
  end
end
