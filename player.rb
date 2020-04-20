class Player
  attr_accessor :name, :cards, :points, :bank

  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @bank = Bank.new
    @bank.set_start_budget
  end

  def reset_cards
    @cards = []
  end

  def add_card(number, deck)
    if number == 2
      @cards << deck.random
      @cards << deck.random
    elsif number == 1
      @cards << deck.random 
    end
  end

  def change_points(deck)
    @points += deck.points_install(@cards)
  end

  def reset_points
    @points = 0
  end

end