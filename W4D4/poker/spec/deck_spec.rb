require "deck"
require "rspec"

describe Deck do 
  let(:suit) {[:S, :H, :D, :C]}
  let(:values) {[:A, :two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :J, :Q, :K]}
  let(:generic_deck) {Deck.new}

  describe "#initialize" do
    it "should create a variable called cards that is an empty array" do
       expect(generic_deck.cards.length).to eq(52)
    end
  end

  describe "#add_shuffled" do
    it "all 52 cards should be distinct" do 
      expect(generic_deck.cards.uniq.length).to eq(52)
    end 

    it "should call shuffle" do 
      expect(generic_deck.cards).to_not eq(suit.product(values))
    end     
  end

end

