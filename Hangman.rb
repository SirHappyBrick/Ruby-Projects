words = [
  'dog',
  'cat',
  'frog',
  'bird',
  'snake'
]

secret_word = words.sample
# puts "Secret word is #{secret_word}"
puts "Secret word is an animal"
board = ["_"] * secret_word.size
puts board.join(" ")

lives = 7

while lives > 0 and board.include?("_")

  print "You have #{lives} left. Please write a letter: "
  guess = gets.chomp
  puts "You selected a letter: #{guess}"

  if secret_word.include?(guess)
    secret_word.chars.each_with_index do |character, index|
      if character == guess
        board[index] = character
      end
    end
    p board.join(" ")
  else
    lives -= 1
    puts "Wrong guess, try again?"
  end
end

puts "The word was: #{secret_word}"
