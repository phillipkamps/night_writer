require "./lib/night_writer"

RSpec.describe NightWriter do
  it "exists" do
    expected = NightWriter.new
    expect(expected).to be_an_instance_of(NightWriter)
  end

  it "reads incoming text" do
    expected = NightWriter.new
    expect(expected.message).to eq("hello world")
  end
end
