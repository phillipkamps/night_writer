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
    braille_to_eng_dict[message_array]
  end
end
