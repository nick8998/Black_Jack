class ToPlay

  def initialize
    puts "Введите имя игрока: "
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
    @bank = 0
  end

  def menu
    @player.cards = []
    @dealer.cards = []
    @player.points = 0
    @dealer.points = 0 
    @cards = Cards.new
    @player.cards << @cards.random
    @dealer.cards << @cards.random
    @player.cards << @cards.random
    @dealer.cards << @cards.random
    @player.points += @cards.points_install(@player.cards)
    @dealer.points += @cards.points_install(@dealer.cards)
    @player.budget = budget_change(@player.budget)
    @dealer.budget = budget_change(@dealer.budget)

    show_cards

    first_step
    
    final_step
  end

  def first_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    puts "Введите 3, чтобы пропустить ход"
    next_action = gets.chomp.to_i

    case next_action
    when 1
      add_card(@player)
      dealer_step_1
    when 2
      show_all_cards
    when 3 
      dealer_step_2
    end
  end

  def next_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    next_action = gets.chomp.to_i

    case next_action
    when 1
      add_card(@player)
      show_all_cards
    when 2
      show_all_cards
    end
  end

  def show_cards
    puts "\n#{@player.name}: #{@player.cards} => #{@player.points} \nDealer: *,*"
    puts "\nОбщий банк: #{@bank}, 
Деньги игрока: #{@player.budget},
Деньги дилера: #{@dealer.budget}"
  end

  def show_all_cards
    puts "#{@player.name}: #{@player.cards} => #{@player.points} 
Dealer: #{@dealer.cards} => #{@dealer.points}"
    mount_cash
  end

  def add_card(name)
    name.cards << @cards.random
    name.points = @cards.points_install(name.cards)
  end

  def dealer_step_1
    if @dealer.points >= 17
      show_all_cards
    else
      add_card(@dealer)
      show_all_cards  
    end
  end

  def dealer_step_2
    if @dealer.points >= 17
      next_step
    else
      add_card(@dealer)
      next_step
    end
  end

  def budget_change(budget)
    budget -= 10
    @bank += 10
    return budget
  end

  def mount_cash
    if @dealer.points < 21
      if @player.points < @dealer.points
        puts "\nВыиграл Dealer" 
        puts "#{@dealer.budget += @bank}"
      elsif @player.points < 21
        puts "\nВыиграл #{@player.name}"
        puts "#{@player.budget += @bank}"
      else
        puts "\nВыиграл Dealer" 
        puts "#{@dealer.budget += @bank}"
      end
    else
      puts "\nНичья!"
      puts "#{@dealer.budget += 10} #{@player.budget += 10}"    
    end
    @bank = 0
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