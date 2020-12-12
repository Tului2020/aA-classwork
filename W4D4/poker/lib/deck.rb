require_relative 'card'


class Deck

  attr_reader :cards

  def initialize
      @cards = add_shuffled
  end

  def add_shuffled
    all_cards = Card.valid_suits.product(Card.valid_values).shuffle
    all_cards.map { |card| Card.new(card[0], card[1])}
  end
end

# d = Deck.new
# d.add_shuffled

# p d.cards.uniq.length

