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

  def translate
    braille_lines_count = (chars.count / 40.0).ceil
    braille_chars = []

    braille_lines_count.times do |i|
      start = (40 * i)
      stop = start + 39

      top_braille_array = chars[start..stop].map { |char| e2b_dictionary[char][0] }
      mid_braille_array = chars[start..stop].map { |char| e2b_dictionary[char][1] }
      bot_braille_array = chars[start..stop].map { |char| e2b_dictionary[char][2] }

      braille_chars << top_braille_array.join + "\n" +
        mid_braille_array.join + "\n" +
        bot_braille_array.join
    end
    braille_chars.join("\n\n")
  end
end
