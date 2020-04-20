class Dealer < Player

  attr_accessor :cards, :points, :bank


  def initialize(name)
    super
  end

  def mount_cash(player, bank)
    if points <= 21
      if player.points < points
        puts "\nВыиграл Dealer" 
        puts "#{@bank.money += bank.money}"
      elsif player.points <= 21
        puts "\nВыиграл #{@player.name}"
        puts "#{player.bank.money += bank.money}"
      else
        puts "\nВыиграл Dealer" 
        puts "#{@bank.money += bank.money}"
      end
    elsif points > 21
      puts "\nВыиграл #{@player.name}"
      puts "#{player.bank.money += bank.money}"
    else
      puts "\nНичья!"
      puts "#{@bank.money += 10} #{player.bank.money += 10}"    
    end
  end
  
  def step
    if points >= 17
      true
    else
      false  
    end
  end
end
