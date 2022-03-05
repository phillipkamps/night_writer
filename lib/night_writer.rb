require "./lib/translator"
require "pry"

handle = File.open(ARGV[0], "r")
@incoming_text = handle.read
handle.close

# put the thing that does the stuff here
translated = Translator.new(@incoming_text)
translated.change_it

writer = File.open(ARGV[1], "w")
writer.write(translated)
writer.close

puts "Created #{ARGV[1]} containing #{@incoming_text.length} characters"
