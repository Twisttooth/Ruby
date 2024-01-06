# Collects expenses until a zero value is entered and stores them in an array.
#
# Parameters:
# - aNum: a float representing the expense value to be added
#
# Returns: None
# Calculates the income by summing up the elements of `@arr2`.
# Prints the sum formatted as a floating-point number with two decimal places.
# Sets the `@income` instance variable to the calculated sum.
#
# Returns:
# None
def calculate_inc()def collect_exp(aNum)
    @arr1 = []
    while true
        print('Add an expense: ')
        aNum = gets().chomp.to_f
        throw (:finished) if (aNum == 0)
        @arr1.push(aNum)
    end
end

# Collects income values until a zero value is entered.
#
# Parameters:
# - aNum: a float representing the income value to be added.
#
# Returns: None
def collect_inc(aNum)
def collect_inc(aNum)
    @arr2 = []
    while true
        print('Add income: ')
        aNum = gets().chomp.to_f
        throw (:income) if (aNum == 0)
        @arr2.push(aNum)
    end
end

<<<<<<<<<<<<<  ✨ Codeium AI Suggestion  >>>>>>>>>>>>>>
+# Calculates the expenses by subtracting each element in @arr1 from the sum.
+# Prints the sum formatted with 2 decimal places and a new line.
+# Sets the @expenses instance variable to the calculated sum.
<<<<<  bot-f3ebc351-9fbf-4292-85ce-e02f010893ca  >>>>>
def calculate_exp()
    sum = 0
    @arr1.each { |a| sum-=a }
    printf("%0.2f", sum)
    puts("")
    @expenses = sum
end

<<<<<<<<<<<<<  ✨ Codeium AI Suggestion  >>>>>>>>>>>>>>
+# Calculates the income by summing up the elements in the `@arr2` array and storing the result in the `@income` variable.
+#
+# @return [void]
+def calculate_inc()
+    sum = 0
+    @arr2.each { |a| sum+=a }
+    printf("%0.2f", sum)
+    @income = sum
+end
<<<<<  bot-2cbab221-1c11-43e3-b509-26049d441f92  >>>>>
def calculate_inc()
    sum = 0
    @arr2.each { |a| sum+=a }
    printf("%0.2f", sum)
    @income = sum
end

catch(:income) do
    num = ""
    collect_inc(num)
end

catch(:finished) do
    num = ""
    collect_exp(num)
end

calculate_inc()
calculate_exp()
puts(@income + @expenses)
