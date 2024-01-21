require 'fileutils'

# Prompt the user for the directory path
puts "Enter the directory path:"
directory_path = gets.chomp

puts "The chosen Directory path is: #{directory_path}"

# Check if the directory exists
if Dir.exist?(directory_path)
  puts "Directory found!"
else
  puts "Directory not found!"
  exit
end

# Get the list of files in the directory
files = Dir.glob("#{directory_path}/*")
puts "Found #{files.length} files/directories"

# Iterate over each file
files.each do |file|
  # Skip if it's a directory
  if File.directory?(file)
    puts "Skipping directory #{file}"
    next
  end

  # Get the file extension
  extension = File.extname(file)

  # Get the creation time of the file
  ctime = File.ctime(file)

  # Format the creation time into a string that represents the year and month
  year = ctime.strftime('%Y')
  month = ctime.strftime('%m')

  # Create the year and month directories if they don't exist
  FileUtils.mkdir_p("#{directory_path}/#{year}/#{month}")

  # Generate a new file name with the creation date
  new_name = ctime.strftime('%Y%m%d_%H%M%S') + extension

  # Move and rename the file
  FileUtils.mv(file, "#{directory_path}/#{year}/#{month}/#{new_name}")
  puts "Moved and renamed file to #{directory_path}/#{year}/#{month}/#{new_name}"
end
