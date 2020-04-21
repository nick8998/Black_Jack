class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    Cards::VALUES.each do |value|
      Cards::SUITS.each do |suit|
        @cards << Cards.new(value, suit)
        validate!
      end
    end
  end

  def validate!
    @cards.each do |card|
      raise "Class isn't Card" if card.class != Cards
    end
  end

  def shuffled
    @cards.shuffle!
  end

  
end