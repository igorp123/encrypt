if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'digest'

puts 'Введите слово или фразу для шифрования:'
string = STDIN.gets.chomp

puts 'Каким способом зашифровать:?'

puts '1. MD5'
puts '2. SHA1'
puts '3. SHA2'

encription_type = STDIN.gets.to_i

if encription_type == 1
  result = Digest::MD5.hexdigest(string)
elsif encription_type == 2
  result = Digest::SHA1.hexdigest(string)
elsif encription_type == 3
  result = Digest::SHA2.hexdigest(string)
end

puts 'Вот что получилось:'
puts result
