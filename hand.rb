class Hand

  def points_install(person)
    cards = person.cards
    cards.each do |card|
      if card.value.to_i < 10 and card.value.to_i > 1 
        person.points += card.value.to_i
      elsif card.value == "T"
        person.points += 0
      else
        person.points += 10
      end 
    end
    cards.each do |card|
      if card.value == "T"
        if person.points < 11
          person.points += 11
        else
          person.points += 1          
        end
      end
    end
  end
end