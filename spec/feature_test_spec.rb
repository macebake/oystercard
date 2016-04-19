require 'oystercard'

describe Oystercard do
  subject(:card) {Oystercard.new}
    describe "deducts fare" do
      it "FEATURE TEST deducts my fare from my card for a journey" do
        card.top_up(50)
        expect(card.balance).to eq 50
        card.deduct_fare(10)
        expect(card.balance).to eq 40
        expect {card.deduct_fare(45)}.to raise_error "Not enough credit on card"
        expect(card.balance).to eq 40
    end
  end
end