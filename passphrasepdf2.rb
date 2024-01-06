require 'pdf-reader'

class PasswordGenerator
  # Initializes a new instance of the PassphrasePDF class.
  #
  # Parameters:
  # - file_name: The name of the file to be processed.
  #
  # Returns: None.
  def initialize(file_name)
    @file_name = file_name
    @words = []
    load_words
  end

  # Loads words from a file or a PDF document into the @words array.
  #
  # If the file has a .pdf extension, it reads the PDF document using the PDF::Reader library
  # and extracts the text from each page, splitting it into words and adding them to the @words array.
  #
  # If the file does not have a .pdf extension, it reads the file contents, strips any leading or trailing whitespace,
  # splits the contents into words, and adds them to the @words array.
  def load_words
    if @file_name.end_with?('.pdf')
      reader = PDF::Reader.new(@file_name)
      reader.pages.each do |page|
        @words.concat(page.text.split)
      end
    else
      file_contents = File.read(@file_name)
      @words.concat(file_contents.strip.split)
    end
  end

  # Generates a password using a specified number of words from a word list.
  #
  # @param number_of_words [Integer] The number of words to include in the password.
  # @param capitalization_probability [Float] The probability of capitalizing a letter in each word.
  #   Defaults to 0.1 (10%).
  # @param replace_probability [Float] The probability of replacing a letter with a special character
  #   in each word. Defaults to 0.1 (10%).
  # @return [String] The generated password.
  def generate_password(number_of_words, capitalization_probability = 0.1, replace_probability = 0.1)
    passphrase = @words.select { |w| w.size >= 5 }.sample(number_of_words).map do |word|
      new_word = word.tr('åäö', 'aao').tr('^a-zA-Z', '')
      new_word.each_char.with_index do |c, i|
        if rand < capitalization_probability
          new_word[i] = c.upcase
        elsif rand < replace_probability
          replacements = { "a" => "4", "i" => "1", "e" => "3" }
          new_word[i] = replacements[c] || c
        else
          new_word[i] = c.downcase
        end
      end
      new_word
    end

    passphrase.join('-')
  end
end

# Creates an instance of the PasswordGenerator class.
#
# Arguments:
# - ARGV[0]: The passphrase used to generate the password.
#
# Example usage:
# generator = PasswordGenerator.new(ARGV[0])
generator = PasswordGenerator.new(ARGV[0])
5.times do
  puts generator.generate_password(5)
end
