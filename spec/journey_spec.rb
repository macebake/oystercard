require 'journey'
describe Journey do
  let(:station) { double :station, zone: 1}
  let(:exit_station) { double :exit_station, zone: 2}
  let(:journey) { described_class.new }
  let(:journey_with_entry) { described_class.new(station) }
  let(:penalty_fare) { described_class::PENALTY_FARE }
  let(:standard_fare) { described_class::STANDARD_FARE }

  describe '#fare' do
    it 'charges a penalty fare if given no entry_station' do
      expect(journey.fare).to eq penalty_fare
    end

    it "returns a penalty fare if no exit station given" do
      expect(journey_with_entry.fare).to eq penalty_fare
    end

    it 'journey with entry and exit charges standard fare' do
      journey_with_entry.finish(exit_station)
      expect(journey_with_entry.fare).to eq standard_fare
    end
  end

  context '' do
    it "creates a journey log which includes entry station" do
      expect(journey_with_entry.log).to include station
    end

    it "creates a journey log including exit stations" do
      journey_with_entry.finish(exit_station)
      expect(journey_with_entry.log[station]).to be exit_station
    end
  end

end
