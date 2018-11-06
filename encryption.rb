if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'digest'

methods = %w(MD5 SHA1 SHA2)

puts 'Введите слово или фразу для шифрования:'
string = STDIN.gets.chomp

puts 'Каким способом зашифровать:?'

methods.each_with_index do |item, index|
  puts "#{index + 1}. #{item}"
end

input = STDIN.gets.to_i

result = case input
         when 1
           Digest::MD5.hexdigest(string)
         when 2
           Digest::SHA1.hexdigest(string)
         when 3
           Digest::SHA2.hexdigest(string)
         end

puts 'Вот что получилось:'
puts result
