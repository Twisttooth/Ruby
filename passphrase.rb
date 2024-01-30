#!/usr/bin/env ruby

words = []

File.open('words.txt', 'r') do |file|
  words = file.read.strip.gsub(/[^\w\s]/, '').split(' ')
end

5.times do

    password = []
    5.times do
        password << words.sample
    end


    puts password.join('-')
end
