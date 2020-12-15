class Card
  attr_reader :value, :suit, :visible

  # :S = Spade, :H = Heart, :D = Diamond, :C = Club
  @@valid_suits = [:S, :H, :D, :C].freeze
  @@valid_values = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :J, :Q, :K, :A].freeze
  @@suits = [ "\u2660", "\u2665", "\u2666", "\u2663"].freeze
  @@values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  def suits
    @@suits
  end

  def values
    @@values
  end

#dasjkljlk

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

  def val_suit
    suit_idx = @@valid_suits.index(@suit)
    value_idx = @@valid_values.index(@value)
    @@suits[suit_idx] + @@values[value_idx]
  end



  def show
    @visible = true
  end

end

# p Card.valid_values.index(:K)
# p Card.val_suit_converter(:S, :ten)
