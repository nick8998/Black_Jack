class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    Cards::VALUES.each do |value|
      Cards::SUITS.each do |suit|
        @cards << Cards.new(value, suit)
      end
    end
  end

  def points_install(cards)
    points = 0
    cards.each do |card|
      if card.card[0].to_i <= 9 and card.card[0].to_i > 1 
        points += card.card[0].to_i
      elsif card.card[0] == "T"
        points += 11 if points < 11
        points += 1 if points >= 11
      else
        points += 10
      end 
    end
    return points
  end

  def shuffled
    @cards.shuffle!
  end

  
end