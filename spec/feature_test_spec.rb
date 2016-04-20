require 'oystercard'
# require 'station'

describe "FEATURE TEST" do
  let(:card) {Oystercard.new}
  let(:name) {double :name}
  let(:zone) {double :zone}
  let (:station) {double :station}
  let(:station_with_args){Station.new("Old Street", 1)}
  let (:entry_station) {double :entry_station}
  let (:exit_station) {double :exit_station}
  let (:journey) { {entry_station: entry_station, exit_station: exit_station} }
  let(:zone){ 1 }
  let(:name){ "Old Street" }
 # let (:station_with_args) {described_class.new name , zone }

    describe "oystercard" do
    #   it "deducts my fare from my card for a journey" do
    #     card.top_up(50)
    #     expect(card.balance).to eq 50
    #     card.deduct_fare(10)
    #     expect(card.balance).to eq 40
    #     expect {card.deduct_fare(45)}.to raise_error "Not enough credit on card"
    #     expect(card.balance).to eq 40
    # end
      describe "card Touchs in and out" do
        before {card.top_up(50)}
        before {card.touch_in(entry_station)}
        it "touches in" do
        expect(card).to be_in_journey
        expect{card.touch_in(entry_station)}.to raise_error "card already in journey"
        end
        it "touches out" do
        card.touch_out(exit_station)
        expect(card).not_to be_in_journey
        expect{card.touch_out(exit_station)}.to raise_error "card not in journey"
      end

    end
      describe "card should have a minimum amount" do
        it "should have a minimum of £#{Oystercard::MIN_FARE} on the card" do
          expect{card.touch_in(entry_station)}.to raise_error "not enough money on the card min balance of £#{Oystercard::MIN_FARE}"
        end
    end
      describe "card deducting fare" do
        it "touching out deducts from the balance" do
        card.top_up(50)
        card.touch_in(entry_station)
        expect{card.touch_out(exit_station)}.to change{card.balance}.by(-Oystercard::MIN_FARE)
      end
    end
      describe "card Rememebers the station on touch in" do
       it "stores the station when you touch in" do
        card.top_up(50)
        card.touch_in(entry_station)
        expect(card.entry_station).to eq entry_station
      end
    end
      describe "card stores the journey history" do
        it "it stores the journey history" do
          card.top_up(50)
          card.touch_in(entry_station)
          card.touch_out(exit_station)
          expect(card.journeys).to eq journey
        end
      end
  end
    describe "Station" do

      it "has a name and a zone" do
        expect(station_with_args.name).to eq("Old Street")
       expect(station_with_args.zone).to eq(1)
    end
  end
  #     describe "Journey" do
  #       it 'deducts a penalty charge if you do not touch out on a journey'  do
  #         card.touch_in
  #         journey.start(entry_station)
  #         journey.finish(exit_station)
  #         card.touch_in.to raise_error "penalty charge of 6"
  #       end
  # end
end
