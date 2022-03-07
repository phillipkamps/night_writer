require "./lib/dictionary"

class Reader
  include Dictionary

  attr_reader :braille_to_eng_dict, :message

  def initialize(message)
    @message = message
    @braille_to_eng_dict = eng_to_braille_dict.invert
  end

  def translate
    message_array = message.split("\n")
    top_row = (message_array.find_all.with_index { |_, i| i % 4 == 0 }).join.chars.each_slice(2).map { |double| double.join }
    mid_row = (message_array.find_all.with_index { |_, i| i % 4 == 1 }).join.chars.each_slice(2).map { |double| double.join }
    bot_row = (message_array.find_all.with_index { |_, i| i % 4 == 2 }).join.chars.each_slice(2).map { |double| double.join }

    eng_letters_count = top_row.count
    eng_letters = eng_letters_count.times.map do |i|
      letter_array = []
      letter_array << top_row[i]
      letter_array << mid_row[i]
      letter_array << bot_row[i]

      braille_to_eng_dict[letter_array]
    end
    eng_letters.join
  end
end
