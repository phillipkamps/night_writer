require "./lib/writer"
require "pry"

RSpec.describe Writer do
  it "has dictionary + space" do
    expected = Writer.new
    expect(expected.e2b_dictionary.count).to eq(27)
  end

  it "converts letter to braille" do
    expected = Writer.new
    expect { puts expected.translate_letter("a") }.to output(
      <<~EXPECTED
        0.
        ..
        ..
      EXPECTED
    ).to_stdout
  end
end
