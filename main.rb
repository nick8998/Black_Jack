require_relative 'cards.rb'
require_relative 'deck.rb'
require_relative 'bank.rb'
require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'hand.rb'
require_relative 'interface.rb'
require_relative 'controller.rb'

@interface = Interface.new
controller = Controller.new(@interface)
controller.controller