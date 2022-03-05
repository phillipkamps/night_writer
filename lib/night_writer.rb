require "./lib/writer"
require "pry"

@incoming_text = File.read(ARGV[0]).chomp

# put the thing that does the stuff here
translated = Writer.new
@in_braille = translated.translate_letter(@incoming_text)

writer = File.open(ARGV[1], "w")
writer.write(@in_braille)
writer.close

puts "Created #{ARGV[1]} containing #{@incoming_text.length} characters"
