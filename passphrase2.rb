#!/usr/bin/env ruby

# Generates a passphrase by randomly selecting words from a given list of words
# and joining them with hyphens.
#
# Parameters:
# - words (list): A list of words to choose from when generating the password.
# - length (int): The desired length of the password.
#
# Returns:
# - str: The generated password.def generate_password(words, length)

  password = Array.new(length) { words[SecureRandom.random_number(words.size)] }
  password.join('-')
end

words = File.readlines('words.txt', chomp: true)
words.map! { |word| word.gsub(/[^\w\s]/, '') }

5.times do
  puts generate_password(words, 5)
end
