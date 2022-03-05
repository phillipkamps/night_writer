require "./lib/translator"
require "pry"

RSpec.describe Translator do
  it "exists" do
    expected = Translator.new("some text")
    expect(expected).to be_an_instance_of(Translator)
  end

  it "reads incoming text" do
    expected = Translator.new("some text")
    expect(expected.incoming_text).to eq("some text")
  end

  it "changes incoming text" do
    expected = Translator.new("some text")
    expected.change_it
    expect(expected).to eq("SOME TEXT")
  end
end
