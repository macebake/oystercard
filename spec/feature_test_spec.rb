require 'oystercard'

describe Oystercard do
  subject(:card) {Oystercard.new}
    describe "FEATURE TEST deducting a fair" do
      it "deducts my fare from my card for a journey" do
        card.top_up(50)
        expect(card.balance).to eq 50
        card.deduct_fare(10)
        expect(card.balance).to eq 40
        expect {card.deduct_fare(45)}.to raise_error "Not enough credit on card"
        expect(card.balance).to eq 40
    end
      describe "FEATURE TEST Touchs in and out" do
        it "touches in" do
        card.touch_in
        expect(card).to be_in_journey
        expect{card.touch_in}.to raise_error "card already in journey"
        card.touch_out
        expect(card).not_to be_in_journey
        expect{card.touch_out}.to raise_error "card not in journey"
        end
      end
  end
end