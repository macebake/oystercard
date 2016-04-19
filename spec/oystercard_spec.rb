require 'oystercard'

<<<<<<< HEAD
describe Oystercard do

	describe '#initalize' do
		it 'has a default balance of £0' do
			expect(subject.balance).to eq(0)
	  end
	end

	describe '#top_up' do
		it 'allows putting money on oystercard' do
			expect{subject.top_up(3)}.to change{subject.balance}.by(3)
		end
		it "can only top up to a maximum of £90" do
			max_balance = Oystercard::MAX_BALANCE
			subject.top_up(max_balance)
			expect{subject.top_up(6)}.to raise_error "Can't top up over £#{max_balance}"
		end
	end

end
=======
describe Oystercard do 

    describe "#initalize" do
        it "has a default balance of £0" do
            expect(subject.balance).to eq 0
      end
    end

    describe "#top_up" do
        it "allows putting money on oystercard" do
            expect(Oystercard.new.top_up(3)).to eq 3
        end
        it "can only top up to a maximum of £90" do
            subject.top_up(90)
            expect{subject.top_up(6)}.to raise_error "Can't top up over £90"
        end
    end

end
>>>>>>> 21b829530b9b0618b877353ae7908f98d7b42a75
