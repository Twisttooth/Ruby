require "Time"
timeis = Time.new()
input = ""

#while the answer is not q, you get to print time and date.

while input != 'q' do
    puts ("Do you want to see..:\n1. Date\n2. Time\nq quits\n\n")
    input = gets().chomp()

    case input
        when "1" then print ("\n"), (timeis.day),("."), (timeis.month),("."), (timeis.year), ("\n"), ("\n")
        when "2" then print ("\n"), (timeis.strftime("%R")),(" "), (timeis.strftime("%z")), ("\n"), ("\n")
    end
end