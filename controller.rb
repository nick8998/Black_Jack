class Controller

  def initialize(interface)
    @interface = interface
    @name = @interface.get_name
    @player = Player.new(@name)
    @dealer = Dealer.new("dealer")
  end

  def controller
    @deck = Deck.new
    starting_play

    @interface.show_cards(@player, @dealer, @bank)

    first_step(@interface.first_step)

    change_points(@player)
    change_points(@dealer)
    @interface.show_all_cards(@player, @dealer)
    mount_cash
    
    breaker if victory?
  end

  def breaker
    finish = @interface.final_step
    nil if finish == 2
    controller if finish == 1
  end


  def starting_play
    @player.hand.reset_cards
    @dealer.hand.reset_cards

    @player.hand.reset_points
    @dealer.hand.reset_points 

    @player.number_card = 0

    @deck.shuffled

    

    @player.add_card(2,@deck)
    @dealer.number_card = @player.number_card + 1
    @dealer.add_card(2,@deck)

    change_points(@player)
    change_points(@dealer)

    @bank = Bank.new
    @player.bank.bet
    @dealer.bank.bet
    @bank.add_bet(Bank::BET)
  end

  def first_step(next_action)
    case next_action
    when 1
      @player.add_card(1, @deck)
      if @dealer.step
        @dealer.add_card(1, @deck)
      else
        nil
      end
      next_step(2)
    when 2
      next_step(2)
    when 3 
      if @dealer.step
        @dealer.add_card(1, @deck)
      else
        nil
      end
      next_step = @interface.next_step
    end
  end

  def next_step(next_action)
    case next_action
    when 1
      @player.add_card(1, @deck)
    when 2
      nil
    end
  end


  def change_points(person)
    person.hand.reset_points
    person.hand.points_install
  end

  def mount_cash
    if @dealer.hand.points <= 21
      points_less_21
    else
      points_more_21
    end
  end

  def points_less_21
    if @player.hand.points > 21
        @dealer.bank.add_money(@bank.money)
        @interface.dealer_win(@dealer.bank.money)
    else
      if @dealer.hand.points < @player.hand.points
        @player.bank.add_money(@bank.money)
        @interface.player_win(@player, @player.bank.money)
      elsif @dealer.hand.points == @player.hand.points
        @dealer.bank.add_money((@bank.money/2).to_i)
        @player.bank.add_money((@bank.money/2).to_i)
        @interface.draw(@player.bank.money, @dealer.bank.money)
      else
        @dealer.bank.add_money(@bank.money)
        @interface.dealer_win(@dealer.bank.money)
      end
    end
  end

  def points_more_21
    if @player.hand.points > 21
      @dealer.bank.add_money((@bank.money/2).to_i)
      @player.bank.add_money((@bank.money/2).to_i)
      @interface.draw(@player.bank.money, @dealer.bank.money)
    else
      @player.bank.add_money(@bank.money)
      @interface.player_win(@player, @player.bank.money)
    end
  end

  def victory?
    if @player.bank.money <= 0
      @interface.dealer_full_win
      false
    elsif @dealer.bank.money <= 0 
      @interface.player_full_win(@player)
      false
    else
      true
    end  
  end

  private

  attr_accessor :cards
end