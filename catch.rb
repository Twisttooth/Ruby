def do_things(aNum)
    i = 0
    while true
        puts("doing things")
        i += 1
        throw (:finished) if i == aNum
    end
end

catch(:finished) do
    print('Enter a number: ')
    num = gets().chomp.to_i
    if num == 0 then
        throw :finished
    end
    
    do_things(num)

end

puts("Bye")