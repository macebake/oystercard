require 'journey'
describe Journey do
  let(:station) { double :station, zone: 1}
  let(:journey) { described_class.new(station) }
  let(:penalty_fare) { described_class::PENALTY_FARE }
  let(:standard_fare) { described_class::STANDARD_FARE }

  describe '#initialize' do
    it "knows if a journey is not complete" do
      expect(journey).not_to be_complete
    end

    it 'has an entry station' do
      expect(journey.entry_station).to eq station
    end

    it 'charges a standard fare by default' do
      expect(journey.fare).to eq standard_fare
    end
  end

  describe '#finish' do
    it 'sets the journey to complete' do
      journey.finish(station)
      expect(journey).to be_complete
    end


  end








  xit "returns itself when exiting a journey" do
    expect(journey.finish(station)).to eq(journey)
  end




    xit "returns a penalty fare if no exit station given" do
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        journey.finish(other_station)
      end

      xit 'calculates a fare' do
        expect(journey.fare).to eq 1
      end


    end
end
