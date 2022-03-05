class Translator
  attr_reader :incoming_text

  def initialize(incoming_text)
    @incoming_text = incoming_text
  end

  def change_it
    p incoming_text.upcase
  end
end
