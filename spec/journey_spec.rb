require 'journey'

describe Journey do
  let(:entry_station) { double(:station) }
  let(:end_station) { double(:station) }
  subject { described_class.new entry_station }

  describe "#initialize" do
    it 'has a starting point' do
      expect(subject.start).to eq entry_station
    end
    it "has no end point" do
      expect(subject.end).to be_nil
    end
  end

  describe "#end=" do
    it "sets the end point" do
      subject.end = end_station
      expect(subject.end).to eq end_station
    end
  end


end
