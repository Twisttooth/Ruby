def collect_exp(aNum)
    @arr1 = []
    while true
        print('Add an expense: ')
        aNum = gets().chomp.to_f
        throw (:finished) if (aNum == 0)
        @arr1.push(aNum)
    end
end

def collect_inc(aNum)
    @arr2 = []
    while true
        print('Add income: ')
        aNum = gets().chomp.to_f
        throw (:income) if (aNum == 0)
        @arr2.push(aNum)
    end
end

def calculate_exp()
    sum = 0
    @arr1.each { |a| sum-=a }
    printf("%0.2f", sum)
    puts("")
    @expenses = sum
end

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
