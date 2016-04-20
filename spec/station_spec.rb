require 'station'

describe Station do
let(:zone){ 1 }
let(:name){ "Old Street" }
  subject {described_class.new name , zone }

  it 'knows its name' do
    expect(subject.name).to eq("Old Street")
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(1)
  end
end
