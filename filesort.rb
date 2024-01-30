#!/usr/bin/env ruby

require 'fileutils'
require 'exifr/jpeg' # Add the import statement for the EXIFR module

# Prompt the user for the directory path
puts "Enter the directory path:"
directory_path = gets.chomp

puts "The chosen Directory path is: #{directory_path}"

if Dir.exist?(directory_path)
  puts "Directory found!"
else
  puts "Directory not found!"
  exit
end

# Get the list of files in the directory and its subdirectories
files = Dir.glob("#{directory_path}/**/*")

# Iterate over each file
files.each do |file|
  # Skip if it's a directory
  next if File.directory?(file)

  # Get the file extension
  extension = File.extname(file)

  # Get the creation time of the file
  begin
    ctime = EXIFR::JPEG.new(file).date_time_original
  rescue
    ctime = File.ctime(file)
  end

  # Skip this file if we couldn't get a valid creation time
  next if ctime.nil?

  # Format the creation time into a string that represents the year and month
  year = ctime.strftime('%Y')
  month = ctime.strftime('%m')

  # Create the year and month directories if they don't exist
  FileUtils.mkdir_p("#{directory_path}/#{year}/#{month}")

  # Generate a new file name with the creation date
  new_name = ctime.strftime('%Y%m%d_%H%M%S') + extension

  # Check if the file name already exists
  counter = 1
  while File.exist?("#{directory_path}/#{year}/#{month}/#{new_name}")
    new_name = ctime.strftime('%Y%m%d_%H%M%S') + "-#{counter.to_s.rjust(3, '0')}" + extension
    counter += 1
  end

  # Copy and rename the file
  FileUtils.cp(file, "#{directory_path}/#{year}/#{month}/#{new_name}")
  puts "Copied and renamed file to #{directory_path}/#{year}/#{month}/#{new_name}"
end
