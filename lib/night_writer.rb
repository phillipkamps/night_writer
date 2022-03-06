require "./lib/writer"
require "pry"

@incoming_text = File.read(ARGV[0]).chomp

# put the thing that does the stuff here
translate_me = Writer.new(@incoming_text)
@in_braille = translate_me.translate

writer = File.open(ARGV[1], "w")
writer.write(@in_braille)
writer.close

puts "Created #{ARGV[1]} containing #{@incoming_text.length} characters"
