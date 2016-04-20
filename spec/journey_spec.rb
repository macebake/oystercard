require 'journey'

describe Journey do
  let(:entrystation) { double(:station) }
  subject { described_class.new entrystation }

  #
  # it "is has a mandatory initialize argument" do
  #   expect{subject.new}.to raise_error ArgumentError
  # end
  #
  # it "is initialized with a start point" do
  #   expect{subject.new start}.not_to raise_error
  # end

  describe "#initialize" do
    it 'expects subject to have a starting point' do
      expect(subject.start).to eq entrystation
    end

  end

  # it {is_expected.to respond_to(:start=).with(1).argument}


end
