require 'journey'

describe Journey do
  subject(:journey) {Journey.new}
  let(:station_initialize_with_arg) {Journey.new(station)}
  let(:station) { double :station}
  let(:other_station) {double :other_station}
  let(:double_journey) { {entry_station: station, exit_station: other_station} }

  it 'know when a journey is not complete' do
    expect(journey).not_to be_complete
  end
  it 'has a penalty fare by default' do
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end
  it 'has an entry station' do
    expect(station_initialize_with_arg.entry_station).to eq [station]
  end
  it 'returns a penalty fare if no exit station' do
   expect(journey.fare).to eq Journey::PENALTY_FARE
  end
  it 'calculates a fare' do
    allow(journey).to receive(:complete?).and_return(true)
     expect(journey.fare).to eq 1
  end
  # it "the storage for journeys will be empty at the beginning" do
  #    expect(journey.journeys).to be_empty
  # end
  it "stores the journey into the journeys variable" do

     station_initialize_with_arg.finish(other_station)
     expect(station_initialize_with_arg.journeys).to include double_journey
  end
end


