require 'journey'

describe Journey do
  let(:entry_station) { double(:station) }
  let(:end_station) { double(:station) }
  subject { described_class.new }

  describe "#initialize" do
    it 'has no starting point' do
      expect(subject.get_start).to be_nil
    end
    it "has no end point" do
      expect(subject.get_end).to be_nil
    end
  end

  describe "#end" do
    it "sets the end point" do
      subject.end end_station
      expect(subject.get_end).to eq end_station
    end
  end

  describe "#complete?" do
    context "if the current journey is complete" do
      before { subject.start entry_station ; subject.end end_station }
      it 'returns true' do
        expect(subject.complete?).to eq true
      end
    end
    context "if the current journey is incomplete" do
      context "if there is only a start station" do
        before { subject.start entry_station }
        it 'returns false' do
          expect(subject.complete?).to eq false
        end
      end
      context "if there is only an end station" do
        before { subject.end end_station }
        it 'returns false' do
          expect(subject.complete?).to eq false
        end
      end
      context "if journey log is empty" do
        it 'returns true' do
          expect(subject.complete?).to eq true
        end
      end
    end
  end

  describe "#fare" do
    context "for an incomplete a journey" do
      it "charges a penalty fare" do
        allow(subject).to receive(:complete?).and_return false
        expect(subject.fare).to eq Journey::PENALTY_FARE
      end
    end
    context "for a complete journey" do
      it "charges the minimum fare" do
        allow(subject).to receive(:complete?).and_return true
        expect(subject.fare).to eq Journey::MIN_FARE
      end
    end
  end


end
