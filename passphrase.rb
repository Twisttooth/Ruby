words = []

File.open('words.txt', 'r') do |file|
  words = file.read.strip.gsub(/[^\w\s]/, '').split(' ')
end

password = []
5.times do
  password << words.sample
end

puts password.join('-')