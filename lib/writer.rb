class Writer
  attr_reader :e2b_dictionary, :chars

  def initialize(message)
    @chars = message.chars
    @e2b_dictionary = {
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
  end

  def top_row
    braille_array = chars.map { |char| e2b_dictionary[char][0] }
    braille_array.join
  end

  def mid_row
    braille_array = chars.map { |char| e2b_dictionary[char][1] }
    braille_array.join
  end

  def bot_row
    braille_array = chars.map { |char| e2b_dictionary[char][2] }
    braille_array.join
  end

  def translate_oneline
    top_row + "\n" + mid_row + "\n" + bot_row
  end

  def translate
    braille_array = chars[0..39].map { |char| e2b_dictionary[char][0] }
    braille_array.join

    # return first 40 chars of each row, then next 40 of each, then next...
  end
end
