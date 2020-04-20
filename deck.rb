class Deck

  def initialize
    @cards = []
    Cards::VALUES.each do |value|
      Cards::SUITS.each do |suit|
        @cards << value+suit
      end
    end
  end

 def points_install(cards)
    points = 0
    cards.each do |v|
      if v[0].to_i <= 9 and v[0].to_i > 1 
        points += v[0].to_i
      elsif v[0] == "T"
        points += 11 if points < 11
        points += 1 if points >= 11
      else
        points += 10
      end 
    end
    return points
  end

  def random
    c = @cards[rand(@cards.size)]
    @cards.delete(c)
    return c
  end

  
end