class Hand
  attr_accessor :cards, :points

  def initialize
    @cards = []
    @points = 0
  end

  def points_install
    @aces = 0
    @cards.each do |card|
      if card.value.to_i < 10 and card.value.to_i > 1 
        @points += card.value.to_i
      elsif card.value == "A"
        @points += 0
        @aces += 1
      else
        @points += 10
      end 
    end
    cards.each do |card|
      if card.value == "A"
        if @aces < 2
          aces_less_2
        else
          aces_more_2
        end
      else
        @points += 0
      end
    end
  end

  def aces_less_2
    if @points < 11
      @points += 11
    else
      @points += 1          
    end
  end

  def aces_more_2
    if @points < 10
      @points += 11
    else
      @points += 1          
    end
  end

  def reset_cards
    @cards = []
  end


  def reset_points
    @points = 0
  end

  def add_cards(card)
    @cards << card
  end
end