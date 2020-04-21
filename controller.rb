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

    @player.change_points(@deck)
    @dealer.change_points(@deck)
    @interface.show_all_cards(@player, @dealer)
    mount_cash

    breaker
  end

  def breaker
    finish = @interface.final_step
    nil if finish == 2
    controller if finish == 1
  end


  def starting_play
    @player.reset_cards
    @dealer.reset_cards

    @player.reset_points
    @dealer.reset_points 

    @deck.shuffled

    @player.add_card(2,@deck)
    @dealer.number_card = @player.number_card + 1
    @dealer.add_card(2,@deck)

    @player.change_points(@deck)
    @dealer.change_points(@deck)

    @bank = Bank.new
    @player.bank.bet
    @dealer.bank.bet
    @bank.add_money(Bank::BET)
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

  def mount_cash
    if @dealer.points <= 21
      if @player.points > 21
        puts "\nВыиграл Dealer" 
        puts "#{@dealer.bank.money += @bank.money}"
      else
        if @dealer.points < @player.points
          puts "\nВыиграл #{@player.name}"
          puts "#{@player.bank.money += @bank.money}"
        elsif @dealer.points == @player.points
          puts "\nНичья!"
          puts "#{@dealer.bank.money += 10} #{@player.bank.money += 10}"
        else
          puts "\nВыиграл Dealer" 
          puts "#{@dealer.bank.money += @bank.money}"
        end
      end
    else
      if @player.points > 21
        puts "\nНичья!"
        puts "#{@dealer.bank.money += 10} #{@player.bank.money += 10}"
      else
        puts "\nВыиграл #{@player.name}"
        puts "#{@player.bank.money += @bank.money}"
      end
    end
  end

  private

  attr_accessor :cards
end