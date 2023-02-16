require 'pdf-reader'

class PasswordGenerator
  def initialize(file_name)
    @file_name = file_name
    @words = []
  end

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

  def generate_password(number_of_words, capitalization_probability = 0.1, replace_probability = 0.1)
    if @words.empty?
      load_words
    end

    passphrase = []
    @words.map { |w| w.tr('åäö', 'aao').tr('^a-zA-Z', '') }
          .select { |w| w.size >= 5 }
          .sample(number_of_words).each do |word|
      new_word = ""
      word.each_char do |c|
        if rand < capitalization_probability
          new_word << c.upcase
        elsif rand < replace_probability
          case c
          when "a"
            new_word << "4"
          when "i"
            new_word << "1"
          when "e"
            new_word << "3"
          else
            new_word << c
          end
        else
          new_word << c.downcase
        end
      end
      passphrase << new_word
    end
    passphrase.join('-')
end
end

generator = PasswordGenerator.new(ARGV[0])
generator.load_words
5.times do
  puts generator.generate_password(5)
end
