require "card"
require "rspec"


describe Card do
  describe "#initialize" do 
  let(:generic_card) {Card.new(:S, :ten)}

    it "should take in 2 values (suit, card value)" do
      expect(generic_card.suit).to eq(:S)
      expect(generic_card.value).to eq(:ten)
    end

    it "should take in a valid card value" do
      expect{ Card.new(:H, :eleven)}.to raise_error("invalid card value")
    end

    it "should take in a valid suit" do
      expect{ Card.new(:x, :ten)}.to raise_error("invalid suit")
    end

    it 'should have a visible/hidden attribute' do
      expect(generic_card.visible).to be false
    end
  end


  describe '#show' do
    it 'should flip the card and show its suit and value' do
      expect(Card.new(:S, :ten).show).to be true
    end
  end


end


# subject(:robot) { Robot.new }