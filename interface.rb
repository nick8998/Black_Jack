class Interface

  def get_name
    puts "Введите имя игрока: "
    return name = gets.chomp
    raise "Имя должно быть больше 4 символов" if name.size < 4
  end


  def first_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    puts "Введите 3, чтобы пропустить ход"
    gets.chomp.to_i
  end

  def next_step
    puts "\nВведите 1, чтобы добавить карту"
    puts "Введите 2, чтобы открыть карты"
    gets.chomp.to_i
  end

  def show_cards(player, dealer, bank)
    print "\n#{player.name} ваши карты:"
    player.hand.cards.each { |c| print " #{c.value}#{c.suit} " }
    puts "\nОчки #{player.name}: #{player.hand.points} \nDealer: *,*"
    puts "\nОбщий банк: #{bank.money}, 
Деньги игрока: #{player.bank.money},
Деньги дилера: #{dealer.bank.money}"
  end

  def show_all_cards(player, dealer)
    print "\n#{player.name} ваши карты:"
    player.hand.cards.each { |c| print " #{c.value}#{c.suit} " }
    puts "\nОчки #{player.name}: #{player.hand.points}\n"
    print "Карты дилера:"
    dealer.hand.cards.each { |c| print " #{c.value}#{c.suit} " }
    puts "\nОчки дилера: #{dealer.hand.points} \n"
  end

  def final_step
    puts "\nВведите 1, если хотите начать заново"
    puts "Введите 2, если хотите выйти"
    gets.chomp.to_i
  end

  def dealer_full_win
    puts "Дилер забирает весь банк. Конец игры"
  end

  def player_full_win(player)
    puts "#{player.name} забирает весь банк. Конец игры"
  end

  def dealer_win(money)
      puts "\nВыиграл Dealer" 
      puts "#{money}"
  end  

  def player_win(player, money)
    puts "\nВыиграл #{player.name}"
    puts "#{money}"
  end

  def draw(p_money, d_money)
    puts "\nНичья!"
    puts "Банк игрока: #{p_money} Банк дилера: #{d_money}"
  end
end