require './test/test_helper'
require 'time'
require './lib/key'
require './lib/offset'
require './lib/enigma'

enigma = Enigma.new
handle = File.open(ARGV[0], "r")
decrypted_file = File.open(ARGV[1], "w")

incoming_text = handle.read
incoming_text = incoming_text.gsub("\n", "")
handle.close

decrypted_file.write(enigma.decrypt(handle, ARGV[2], ARGV[3])[:decryption])

puts "Created #{ARGV[1]} with the key #{decrypted_file[:key]} and date #{decrypted_file[:date]}"
