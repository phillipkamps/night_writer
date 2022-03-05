require "./lib/night_writer"

RSpec.describe NightWriter do
  it "exists" do
    expected = NightWriter.new
    expect(expected).to be_an_instance_of(NightWriter)
  end
end
