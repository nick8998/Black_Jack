class Dealer < Player

  attr_accessor :cards, :points, :bank


  def initialize(name)
    super
  end

  def mount_cash(player, bank)
    if points <= 21
      if player.points > 21
        puts "\nВыиграл Dealer" 
        puts "#{@bank.money += bank.money}"
      else
        if points < player.points
          puts "\nВыиграл #{player.name}"
          puts "#{player.bank.money += bank.money}"
        elsif points == player.points
          puts "\nНичья!"
          puts "#{@bank.money += 10} #{player.bank.money += 10}"
        else
          puts "\nВыиграл Dealer" 
          puts "#{@bank.money += bank.money}"
        end
      end
    else
      if player.points > 21
        puts "\nНичья!"
        puts "#{@bank.money += 10} #{player.bank.money += 10}"
      else
        puts "\nВыиграл #{player.name}"
        puts "#{player.bank.money += bank.money}"
      end
    end

  end
  
  def step
    if points < 17
      true
    else
      false  
    end
  end
end
