def decode_char(char)
  morse_dict = {
    '.-' => 'A', '-...' => 'B', '-.-.' => 'C', '-..' => 'D', '.' => 'E', '..-.' => 'F', '--.' => 'G',
    '....' => 'H', '..' => 'I', '.---' => 'J', '-.-' => 'K', '.-..' => 'L', '--' => 'M', '-.' => 'N',
    '---' => 'O', '.--.' => 'P', '--.-' => 'Q', '.-.' => 'R', '...' => 'S', '-' => 'T', '..-' => 'U',
    '...-' => 'V', '.--' => 'W', '-..-' => 'X', '-.--' => 'Y', '--..' => 'Z', '.----' => '1', '..---' => '2',
    '...--' => '3', '....-' => '4', '.....' => '5', '-....' => '6', '--...' => '7', '---..' => '8', '----.' => '9',
    '-----' => '0', '--..--' => ',', '..--..' => '?'
  }
  morse_dict[char].to_s
end

def decode_word(word)
  new_word = ''
  word.split.each { |char| new_word += decode_char(char) }
  new_word
end

def decode_message(message)
  new_message = ''
  last_word = message.split('   ').last

  message.split('   ').each do |word|
    new_message += if word == last_word
                     decode_word(word)
                   else
                     "#{decode_word(word)} "
                   end
  end
  new_message
end

p decode_char('.-')
p decode_word('-- -.--')
p decode_message('-- -.--   -. .- -- .')
p decode_message('.-   -... --- -..-   ..-. ..- .-.. .-..    --- ..-.    .-. ..- -... .. . ...')
