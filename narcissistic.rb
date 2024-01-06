=begin
    The narcissistic?
    method checks if the integer is narcissistic by first checking if it is negative,
    then calculating the sum of each digit raised to the power of the number of digits,
    and finally comparing the sum with the original integer.

=end

value = (1 + rand(9) * 100) + (1 + rand(9) * 10) + (1 + rand(9))
sum = 0
puts value


class Integer
    def narcissistic?
      return false if negative?
      digs = self.digits
      m    = digs.size
      digs.map{|d| d**m}.sum == self
    end
end

while value.narcissistic? == false do
    if value.narcissistic?
        puts("true")
    else
        puts("false")
    end
end
