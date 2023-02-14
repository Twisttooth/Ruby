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
      File.open(@file_name).each do |line|
        @words.concat(line.strip.split)
      end
    end
  end

  def generate_password(number_of_words)
    load_words
    @words.map { |w| w.gsub(/[^a-zA-Z0-9]/, '') }
          .select { |w| w.size >= 5 }
          .sample(number_of_words)
          .join(' ')
  end
end

generator = PasswordGenerator.new(ARGV[0])
puts generator.generate_password(ARGV[1].to_i)