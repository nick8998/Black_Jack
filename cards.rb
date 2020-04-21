class Cards
  SUITS = ["<>","^","<3","+"]
  VALUES = ["2","3","4","5","6","7","8","9","10","V","Q","K","T"]

  attr_reader :card 
  
  def initialize(suit, value)
    @card = suit+value
  end
end