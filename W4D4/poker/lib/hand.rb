# Five of a Kind – This is the highest possible hand and can occur only in games where at 
# least one card is wild, such as a joker, the two one-eyed jacks, or the four deuces. 
# Examples of five of a kind would be four 10s and a wild card or two queens and three wild cards.

# Straight Flush – This is the highest possible hand when only the standard pack is used, and 
# there are no wild cards. A straight flush consists of five cards of the same suit in sequence, 
# such as 10, 9, 8, 7, 6 of hearts. The highest-ranking straight flush is the A, K, Q, J, and 10 
# of one suit, and this combination has a special name: a royal flush or a royal straight flush. 
# The odds on being dealt this hand are 1 in almost 650,000.

# Four of a Kind – This is the next highest hand, and it ranks just below a straight flush. An 
# example is four aces or four 3s. It does not matter what the fifth, unmatched card is.

# Full House – This colorful hand is made up of three cards of one rank and two cards of another 
# rank, such as three 8s and two 4s, or three aces and two 6s.

# Flush – Five cards, all of the same suit, but not all in sequence, is a flush. An example is Q, 
# 10, 7, 6, and 2 of clubs.

# Straight – Five cards in sequence, but not all of the same suit is a straight. An example is 9♥, 
# 8♣, 7♠, 6♦, 5♥.

# Three of a Kind – This combination contains three cards of the same rank, and the other two 
# cards each of a different rank, such as three jacks, a seven, and a four.

# Two Pairs – This hand contains a pair of one rank and another pair of a different rank, plus 
# any fifth card of a different rank, such as Q, Q, 7, 7, 4.

# One Pair – This frequent combination contains just one pair with the other three cards being 
# of different rank. An example is 10, 10, K, 4, 3.

# No Pair – This very common hand contains "nothing." None of the five cards pair up, nor are 
# all five cards of the same suit or consecutive in rank. When more than one player has no pair, 
# the hands are rated by the highest card each hand contains, so that an ace-high hand beats a 
# king-high hand, and so on.
require_relative 'card'


class Hand

    

    def valid_values
        Card.valid_values
    end

    def initialize(cards)
        @cards = cards
    end

    def self.check
    end


    def ranker(value)
        valid_values.index(value)
    end


    # 10
    def high_card?
        values = @cards.map { |el| el.value}        # contains values of all cards in hand
        values.inject(:two) do |acc, el|            # figures out the highest ranking value
            acc_rank = ranker(acc)
            el_rank = ranker(el)
            if acc_rank < el_rank
                el
            else
                acc
            end
        end
    end

    # 9
    def straight?
        values = @cards.map { |el| ranker(el.value)}
    end

    # 8 
    def one_pair?
    end

    # 7
    def two_pair?
    end

    # 6
    def three_kind?
    end

    # 5
    def flush?
    end

    # 4 
    def full_house?
    end


    # 3
    def four_kind?
    end


    # 2
    def straight_flush?
    end


    # 1
    def royal_flush?
    end

    


    # 6, 7, 8, 9, 10 => 1, 1, 1, 1


end


cards = [Card.new(:S, :seven), Card.new(:H, :eight), Card.new(:S, :nine), Card.new(:H, :ten), Card.new(:S, :J), Card.new(:H, :Q)]

h = Hand.new(cards)
p h.straight?


