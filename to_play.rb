class ToPlay

  def initialize
    puts "Введите имя игрока: "
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new("dealer")

  end

  def menu

    starting_play

    show_cards

    first_step
    
    final_step
  end

  def starting_play
    @player.reset_cards
    @dealer.reset_cards

    @player.reset_points
    @dealer.reset_points 

    @cards = Deck.new

    @player.add_card(2,@cards)
    @dealer.add_card(2,@cards)

    @player.change_points(@cards)
    @dealer.change_points(@cards)

    @bank = Bank.new
    @player.bank.bet
    @dealer.bank.bet
    @bank.add_money(Bank::BET)
  end

  def first_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    puts "Введите 3, чтобы пропустить ход"
    next_action = gets.chomp.to_i

    case next_action
    when 1
      @player.add_card(1, @cards)
      @dealer.step_1
    when 2
      show_all_cards
    when 3 
      @dealer.step_2
    end
  end

  def next_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    next_action = gets.chomp.to_i

    case next_action
    when 1
      @player.add_card(1, @cards)
      show_all_cards
    when 2
      show_all_cards
    end
  end

  def show_cards
    puts "\n#{@player.name}: #{@player.cards} => #{@player.points} \nDealer: *,*"
    puts "\nОбщий банк: #{@bank.money}, 
Деньги игрока: #{@player.bank.money},
Деньги дилера: #{@dealer.bank.money}"
  end

  def show_all_cards
    puts "#{@player.name}: #{@player.cards} => #{@player.points} 
Dealer: #{@dealer.cards} => #{@dealer.points}"
    @dealer.mount_cash(@player, @bank)
  end

  




  def final_step
    puts "\nВведите 1, если хотите начать заново"
    puts "Введите 2, если хотите выйти"
    next_action = gets.chomp.to_i
    case next_action 
    when 1
      menu
    when 2
      nil
    end
  end

  private

  attr_accessor :cards
end