require "journeylog"


describe JourneyLog do

  let(:journey){ double :journey}

  it "add should add the last journey to the log" do
    subject.add(journey)
    expect(subject.log).to include(journey)
  end

  it "log should return all previous journeys" do
    3.times{subject.add(journey)}
    expect(subject.log).to eq [journey, journey, journey]
  end
end
