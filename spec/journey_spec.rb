require 'journey'
describe Journey do
  let(:station_initialize_with_arg) {Journey.new(station)}
  let(:station) { double :station}
  let(:other_station) {double :other_station}
  it 'know when a journey is not complete' do
    expect(station_initialize_with_arg).not_to be_complete
  end
  it 'has a penalty fare by default' do
    expect(station_initialize_with_arg.fare).to eq Journey::PENALTY_FARE
  end



    #subject {described_class.new(entry_station: station)}

    it 'has an entry station' do
      expect(station_initialize_with_arg.entry_station).to eq station
    end
    it 'returns a penalty fare if no exit station' do
      expect(station_initialize_with_arg.fare).to eq Journey::PENALTY_FARE
    end
    it 'calculates a fare' do
      expect(station_initialize_with_arg.fare).to eq 1
    end
  end