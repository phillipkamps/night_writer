class NightWriter
  attr_reader :message
  def initialize
    handle = File.open(ARGV[0], "r")
    @message = handle.read
    handle.close
  end
end
# dc_text = incoming_text.downcase
