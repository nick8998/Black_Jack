require_relative 'cards.rb'
require_relative 'deck.rb'
require_relative 'bank.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'to_play.rb'

class Game
  puts "Введите имя игрока: "
  name = gets.chomp
  raise "Имя должно быть больше 4 символов" if name.size < 4
  @player = Player.new(name)
  @dealer = Dealer.new("dealer")
  

  while true
    @start = ToPlay.new(@player, @dealer)
    @start.menu
    finish = @start.instance_variable_get(:@next_action)
    break if finish == 2
  end
end

Game.new