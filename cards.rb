class Cards
  SUITS = ["<>","^","<3","+"]
  VALUES = ["2","3","4","5","6","7","8","9","10","V","Q","K","T"]

  attr_reader :value, :suit
  
  def initialize(value, suit)
   @value = value
   @suit = suit
  end
end