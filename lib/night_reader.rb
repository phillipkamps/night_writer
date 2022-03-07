require "./lib/reader"
require "pry"

@incoming_text = File.read(ARGV[0]).chomp

# put the thing that does the stuff here
translate_me = Reader.new(@incoming_text)
@in_eng = translate_me.translate

writer = File.open(ARGV[1], "w")
writer.write(@in_eng)
writer.close

puts "Created #{ARGV[1]} containing #{@in_eng.length} characters"
