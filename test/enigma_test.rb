require './test/test_helper'
require 'time'
require './lib/key'
require './lib/offset'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_shifts
    assert_equal 4, @enigma.shifts(Key.new, Offset.new).length
  end

  def test_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895" }
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt
    expected ={decryption: "hello world", key: "02715", date: "040895" }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_encrypt_without_date
    date = Time.now.strftime("%d%m%y")
    expected = {encryption: "pib wdmczpu", key: "02715", date: date}
    assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_without_date
    date = Time.now.strftime("%d%m%y")
    encrypted = @enigma.encrypt("hello world", "02715")
    expected = {decryption: "hello world", key: "02715", date: date}
    assert_equal expected, @enigma.decrypt(encrypted[:encryption], "02715")
  end

end
