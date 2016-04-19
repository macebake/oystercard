require "oystercard"

describe Oystercard do
  subject(:card) { described_class.new }

  describe "#initialize" do
    it { is_expected.not_to be_in_journey }
    it "has a starting balance" do
      expect(card.balance).to eq Oystercard::INITIAL_BALANCE
    end
  end

  describe "#top_up" do
    context "adding a valid amount" do
      let(:amount) { rand(Oystercard::MAX_BALANCE) }
      it "tops up the balance with the specified amount" do
        card.top_up(amount)
        expect(card.balance).to eq amount
      end
    end

    context "exceeding the maximum balance" do
      before { card.top_up Oystercard::MAX_BALANCE }
      it "raises an error" do
        expect{ card.top_up 1 }.to raise_error Oystercard::MAX_BAL_ERR
      end
      it "does not top up the balance" do
        begin
          card.top_up 1
        rescue
          expect(card.balance).to eq Oystercard::MAX_BALANCE
        end
      end
    end
  end

  describe "#touch_in" do
    context "outside a journey" do
      context "sufficient funds" do
        before { card.top_up Oystercard::MIN_FARE }
        it "starts a journey" do
          expect { card.touch_in }.to change { card.in_journey? }.to true
        end
      end

      context "insufficient funds" do
        it "raises an error" do
          expect { card.touch_in }.to raise_error Oystercard::MIN_BAL_ERR
        end
      end
    end
  end

  describe "#touch_out" do
    context "during a journey" do
      before { card.top_up Oystercard::MIN_FARE; card.touch_in }
      it "ends the journey" do
        expect { card.touch_out }.to change { card.in_journey? }.to false
      end
      it "deducts the balance by minimum fare" do
        expect { card.touch_out }.to change { card.balance }.by(-Oystercard::MIN_FARE)
      end
    end
  end
end
