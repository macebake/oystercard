require 'oystercard'

describe Oystercard do
subject(:card) {Oystercard.new}
#subject(:card_topped_up) {Oystercard.new(50)}
it { is_expected.to respond_to(:top_up) }
it { is_expected.to respond_to(:deduct_fare).with(1).argument }


	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(card.balance).to eq(0)
	  end
	end

	describe '#top_up' do

		it 'allows putting money on oystercard' do
			expect{card.top_up(3)}.to change{card.balance}.by(3)
		end
		it "can only top up to a maximum of £90" do
			max_balance = Oystercard::MAX_BALANCE
			card.top_up(max_balance)
			expect{card.top_up(6)}.to raise_error "Can't top up over £#{max_balance}"
		end
	end
  describe '#deduct_fare' do
    it "checks to see if card fare is deducted from balance" do
      card.top_up(50)
      card.deduct_fare(5)
      expect(card.balance).to eq 45
    end
    it "raises error if fare exceeds balance" do
      expect{card.deduct_fare(5)}.to raise_error "Not enough credit on card"
    end
  end
end

