class Player
  attr_accessor :name, :cards, :points, :budget

  def initialize(name)
    @name = name
    @cards = []
    @points = 0
    @budget = 100
  end

end