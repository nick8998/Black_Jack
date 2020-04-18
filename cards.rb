class Cards
  def initialize
    @cards = ["2+", "2<3", "2^", "2<>",
              "3+", "3<3", "3^", "3<>",
              "4+", "4<3", "4^", "4<>",
              "5+", "5<3", "5^", "5<>",
              "6+", "6<3", "6^", "6<>",
              "7+", "7<3", "7^", "7<>",
              "8+", "8<3", "8^", "8<>",
              "9+", "9<3", "9^", "9<>",
              "10+", "10<3", "10^", "10<>",
              "V+", "V<3", "V^", "V<>",
              "Q+", "Q<3", "Q^", "Q<>",
              "K+", "K<3", "K^", "K<>",
              "T+", "T<3", "T^", "T<>"]
  end

  def points_install(cards)
    points = 0
    cards.each do |v|
      if v[0].to_i <= 9 and v[0].to_i > 1 
        points += v[0].to_i
      elsif v[0] == "T"
        points += 11 if points < 11
        points += 1 if points >= 11
      else
        points += 10
      end 
    end
    return points
  end

  def random
    c = @cards[rand(@cards.size)]
    @cards.delete(c)
    return c
  end
end