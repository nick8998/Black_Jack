class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def points_install(person)
    cards = person.hand.cards
    @aces = 0
    cards.each do |card|
      if card.value.to_i < 10 and card.value.to_i > 1 
        person.points += card.value.to_i
      elsif card.value == "A"
        person.points += 0
        @aces += 1
      else
        person.points += 10
      end 
    end
    cards.each do |card|
      if card.value == "A"
        if @aces < 2
          if person.points < 11
            person.points += 11
          else
            person.points += 1          
          end
        else
          if person.points < 10
            person.points += 11
          else
            person.points += 1          
          end
        end
      else
        person.points += 0
      end
    end
  end

  def reset_cards
    @cards = []
  end
end