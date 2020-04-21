class Player

  
  attr_accessor :name, :cards, :points, :bank, :number_card

  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @bank = Bank.new
    @bank.set_start_budget
    @number_card = 0
  end

  def reset_cards
    @cards = []
  end

  def add_card(number, deck)
    if number == 2
      @cards << deck.cards[@number_card]
      @number_card += 1
      @cards << deck.cards[@number_card]
      @number_card += 1
    elsif number == 1
      @cards << deck.cards[@number_card]
      @number_card += 1
    end
  end


  def reset_points
    @points = 0
  end

end