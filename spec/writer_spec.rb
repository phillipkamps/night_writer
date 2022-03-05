require "./lib/writer"
require "pry"

RSpec.describe Writer do
  it "has attributes" do
    expected = Writer.new
    expect(expected.english_to_braille.count).to eq(27)
  end
end
