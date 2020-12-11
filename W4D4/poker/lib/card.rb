class Card
  attr_reader :value, :suit, :visible

  @@valid_suits = [:S, :H, :D, :C]
  @@valid_values = [:A, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :J, :Q, :K]

  def self.valid_suits
    @@valid_suits
  end

  def self.valid_values
    @@valid_values
  end


  def initialize(suit, value)
    raise "invalid card value" unless @@valid_values.include?(value)
    raise "invalid suit" unless @@valid_suits.include?(suit)

    @value = value
    @suit = suit
    @visible = false
  end

  def show
    @visible = true
  end

end

# p Card.valid_suits

