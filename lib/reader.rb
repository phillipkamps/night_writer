require "./lib/dictionary"

class Reader
  include Dictionary

  attr_reader :braille_to_eng_dict

  def initialize
    @braille_to_eng_dict = eng_to_braille_dict.invert
  end
end
