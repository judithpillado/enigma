require './test/test_helper'
require 'time'
require './lib/key'
require './lib/offset'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
encrypted_file = File.open(ARGV[1], "w")

incoming_text = handle.read
incoming_text = incoming_text.gsub("\n", "")
handle.close

encrypted_file.write(enigma.encrypt(handle, ARGV[2], ARGV[3])[:encryption])

puts "Created #{ARGV[1]} with the key #{encrypted_file[:key]} and date #{encrypted_file[:date]}"
