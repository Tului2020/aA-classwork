require "hand"
require "rspec"

describe Hand do
    # let(:h) { Hand.new}

    describe "::check" do
        it 'should check' do
            expect(Hand.check).to eq(4)
        end
    end

    describe "#one_pair" do
        it should 'check if hand contains one pair' do
            
        end
    end


end