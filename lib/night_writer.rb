require "./lib/writer"
require "pry"

@incoming_text = File.read(ARGV[0])

# put the thing that does the stuff here
translated = Writer.new
translated.translate_letter(@incoming_text.chomp)

writer = File.open(ARGV[1], "w")
writer.write(translated)
writer.close

puts "Created #{ARGV[1]} containing #{@incoming_text.length} characters"
