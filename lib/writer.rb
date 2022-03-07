require "./lib/dictionary"

class Writer
  include Dictionary

  attr_reader :eng_chars

  def initialize(message)
    @eng_chars = message.chars
  end

  def translate
    braille_lines_count = (eng_chars.count / 40.0).ceil
    braille_lines = braille_lines_count.times.map do |i|
      start = (40 * i)
      stop = start + 39

      top_braille_row = eng_chars[start..stop].map { |eng_char| eng_to_braille_dict[eng_char][0] }
      mid_braille_row = eng_chars[start..stop].map { |eng_char| eng_to_braille_dict[eng_char][1] }
      bot_braille_row = eng_chars[start..stop].map { |eng_char| eng_to_braille_dict[eng_char][2] }

      top_braille_row.join + "\n" +
        mid_braille_row.join + "\n" +
        bot_braille_row.join
    end
    braille_lines.join("\n\n")
  end
end
