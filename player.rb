class Player

  
  attr_accessor :name, :hand, :bank, :number_card

  def initialize(name)
    @name = name
    @hand = Hand.new
    @bank = Bank.new
    @bank.set_start_budget
    @number_card = 0
  end

  def add_card(number, deck)
    if number == 2
      @hand.add_cards(deck.cards[@number_card])
      @number_card += 1
      @hand.add_cards(deck.cards[@number_card])
      @number_card += 1
    elsif number == 1
      @hand.add_cards(deck.cards[@number_card])
      @number_card += 1
    end
  end


end