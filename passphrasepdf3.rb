require 'pdf-reader'
require 'set'

class PasswordGenerator
  def initialize(file_name)
    @file_name = file_name
    @words = Set.new
    load_words
  end

  def load_words
    if @file_name.end_with?('.pdf')
      reader = PDF::Reader.new(@file_name)
      reader.pages.each do |page|
        @words.merge(page.text.split)
      end
    else
      file_contents = File.read(@file_name)
      @words.merge(file_contents.strip.split)
    end
    @words.select! { |w| w.size >= 5 }
  end

  def generate_password(number_of_words, capitalization_probability = 0.1, replace_probability = 0.1)
    passphrase = @words.sample(number_of_words).map do |word|
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

generator = PasswordGenerator.new(ARGV[0])
5.times do
  puts generator.generate_password(5)
end
