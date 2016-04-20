require 'journey'

describe Journey do
  subject { described_class }
  let(:start) { double(:station) }


  it "is has a mandatory initialize argument" do
    expect{subject.new}.to raise_error ArgumentError
  end

  it "is initialized with a start point" do
    expect{subject.new start}.not_to raise_error
  end

  # it {is_expected.to respond_to(:start=).with(1).argument}

  # describe "#start=" do
  #   it "sets the start point" do

  #   end
  # end



end
