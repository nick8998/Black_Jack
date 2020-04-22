class Cards
  SUITS = ["<>","^","<3","+"].freeze
  VALUES = ["2","3","4","5","6","7","8","9","10","V","Q","K","A"].freeze

  attr_reader :value, :suit
  
  def initialize(value, suit)
   @value = value
   @suit = suit
   validate!
  end

  def validate!
    raise "Такое значение недопустимо" unless VALUES.include?(@value) or SUITS.include?(@suit)
  end
  
end