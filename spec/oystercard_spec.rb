require "oystercard"

describe Oystercard do
   let(:weeksfare) {50}
   let(:entry_station) { double(:entry_station)}
   let(:exit_station) { double(:exit_station)}
   let(:standard_fare) { 1 }
   let(:penalty_fare) { 6 }

   describe "#balance" do

     it "should be 0 when new oyster created by default" do
       expect(subject.balance).to eq 0
     end
   end

   describe "#top_up" do

     it "should add money to previous balance" do
       expect{subject.top_up 6 }.to change{ subject.balance }.by 6
     end

     it "should limit the top_up amount to £90" do
       max_balance = Oystercard::MAXIMUM_BALANCE
       subject.top_up max_balance
       expect{ subject.top_up 1 }.to raise_error "Top up limit is #{max_balance}"
     end
   end

  describe "#in_journey" do
    it "should not be in_journey when created" do
      expect(subject.in_use).to be false
    end
  end

  describe "#touch_in" do
    it "should touch in" do
      subject.top_up(weeksfare)
      subject.touch_in entry_station
      expect(subject.in_use).to eq true
    end

    it 'should not allow to touch in if you have insufficient funds' do
      expect{subject.touch_in(entry_station)}.to raise_error("You have insufficient funds")
    end
  end

  describe "#touch_out" do
    it "should touch out" do
      subject.touch_out(exit_station)
      expect(subject.in_use).to eq false
    end

    it "should charge standard fare on touch out" do
      subject.top_up(weeksfare)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-standard_fare)
    end

    it "should charge penalty fare on touch out if not touched in" do
      subject.top_up(weeksfare)
      expect{subject.touch_out(exit_station)}.to change{subject.balance}.by(-penalty_fare)
    end
  end

  describe '#history' do
    before do
      subject.top_up(weeksfare)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
    end
  end
end
