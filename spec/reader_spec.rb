require "./lib/reader"
require "pry"

RSpec.describe Reader do
  it "exists" do
    expected = Reader.new(
      <<~INPUT.strip
        0.
        ..
        ..
      INPUT
    )
    expect(expected).to be_an_instance_of(Reader)
  end

  it "has dictionary + space" do
    expected = Reader.new(
      <<~INPUT.strip
        0.
        ..
        ..
      INPUT
    )
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
    expect(expected.braille_to_eng_dict).to eq(expected_dictionary.invert)
  end

  it "translates braille character to english" do
    expected = Reader.new(
      <<~INPUT.strip
        0.
        ..
        ..
      INPUT
    )
    expect(expected.translate).to eq("a")
  end

  it "translates braille words to english" do
    expected = Reader.new(
      <<~INPUT.strip
        0.0.0.0.0....00.0.0.00
        00.00.0..0..00.0000..0
        ....0.0.0....00.0.0...
      INPUT
    )
    expect(expected.translate).to eq("hello world")
  end

  it "translates braille messages (multi-line) to english" do
    expected = Reader.new(
      <<~INPUT.strip
        .00.0.0.00...0.00.0...000..0...00.0.0...0..00.00..000.0.0....00.0.0.0.0.0....00.
        00.00000.0..000.0.0....0.000..00.....0....00...0...0.0..00..0000.0..0.0..0..00.0
        .00.0.0.00...0..0.0...0.0.0...0...0........0..00..000.000...0.0.0.00..0.....0.0.

        000.0.0.0..0..0.000.00..000.0.0...000.0.000....00.000.00
        ...00000.000...0.00..0...0.0..00..0..0.....0..00.0.0...0
        0.0.0.0.0..0..0.0.0.00..000.000...0...........0.0.....00
      INPUT
    )
    expect(expected.translate).to eq("worry will not take away your trouble tomorrow only your peace today")
  end
end
