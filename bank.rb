class Bank
  attr_accessor :money
  BET = 10
  START_BUDGET = 100

  def initialize
    @money = 0
  end

  def set_start_budget
    @money = START_BUDGET
  end

  def bet
    @money -= BET
  end

  def add_bet(bet)
    @money += bet*2
  end

  def add_money(money)
    @money += money
  end

end