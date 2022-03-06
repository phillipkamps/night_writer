require "./lib/writer"
require "pry"

RSpec.describe Writer do
  it "has dictionary + space" do
    expected = Writer.new("a")
    expected_dictionary = {
      "a" => ["0.", "..", ".."],
      "b" => ["0.", "0.", ".."],
      "c" => ["00", "..", ".."],
      "d" => ["00", ".0", ".."],
      "e" => ["0.", ".0", ".."],
      "f" => ["00", "0.", ".."],
      "g" => ["00", "00", ".."],
      "h" => ["0.", "00", ".."],
      "i" => [".0", "0.", ".."],
      "j" => [".0", "00", ".."],
      "k" => ["0.", "..", "0."],
      "l" => ["0.", "0.", "0."],
      "m" => ["00", "..", "0."],
      "n" => ["00", ".0", "0."],
      "o" => ["0.", ".0", "0."],
      "p" => ["00", "0.", "0."],
      "q" => ["00", "00", "0."],
      "r" => ["0.", "00", "0."],
      "s" => [".0", "0.", "0."],
      "t" => [".0", "00", "0."],
      "u" => ["0.", "..", "00"],
      "v" => ["0.", "0.", "00"],
      "w" => [".0", "00", ".0"],
      "x" => ["00", "..", "00"],
      "y" => ["00", ".0", "00"],
      "z" => ["0.", ".0", "00"],
      " " => ["..", "..", ".."]
    }
    expect(expected.e2b_dictionary).to eq(expected_dictionary)
  end

  it "translates words to braille - top row" do
    expected = Writer.new("hello world")
    expect(expected.top_row).to eq("0.0.0.0.0....00.0.0.00")
  end

  it "translates words to braille - middle row" do
    expected = Writer.new("hello world")
    expect(expected.mid_row).to eq("00.00.0..0..00.0000..0")
  end

  it "translates words to braille - bottom row" do
    expected = Writer.new("hello world")
    expect(expected.bot_row).to eq("....0.0.0....00.0.0...")
  end

  it "translates letter to braille" do
    expected = Writer.new("a")
    expect { puts expected.translate_oneline }.to output(
      <<~EXPECTED
        0.
        ..
        ..
      EXPECTED
    ).to_stdout
  end

  it "translates words to braille" do
    expected = Writer.new("hello world")
    expect { puts expected.translate_oneline }.to output(
      <<~EXPECTED
        0.0.0.0.0....00.0.0.00
        00.00.0..0..00.0000..0
        ....0.0.0....00.0.0...
      EXPECTED
    ).to_stdout
  end

  it "splits messages over 80 characters" do
    expected = Writer.new("worry will not take away your trouble tomorrow only take away your peace today")
    expect { puts expected.translate_message }.to output(
      <<~EXPECTED
        .00.0.0.00...0.00.0...000..0...00.0.0...0..00.00..000.0.0....00.0.0.0.0.0....00.
        00.00000.0..000.0.0....0.000..00.....0....00...0...0.0..00..0000.0..0.0..0..00.0
        .00.0.0.00...0..0.0...0.0.0...0...0........0..00..000.000...0.0.0.00..0.....0.0.
        000.0.0.0..0..0.000.00...00.0.0...0..00.00..000.0.0...000.0.000....00.000.00
        ...00000.000...0.00..0..00.....0....00...0...0.0..00..0..0.....0..00.0.0...0
        0.0.0.0.0..0..0.0.0.00..0...0........0..00..000.000...0...........0.0.....00
      EXPECTED
    ).to_stdout
  end
end
