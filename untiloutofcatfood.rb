#this program will run until you need to go get more cat food, which is quite silly but it helps me practise :)
#this is the same as the while-loop practise, but this time with until-loop.

puts("How many portions of food do you have for your cat?")
$catFoodamount = gets.to_i
catHunger = false

#define what it means to be out of food
def out_of_food
    if $catFoodamount > 0 then
        catHunger = true
        return false
    else
        return true
    end
end

#and no need to determine having food, so I removed it this time.

#heres one way to make a until loop, I like the multi-line look because it's easily readable.
until out_of_food
    puts( "You have #{$catFoodamount} portions of cat food." )
    
    #note here that the cat is not initially 'hungry', so you will have 2 results for the first input of food.
    if catHunger == true
        puts( "But cat was hungry so it ate some." )
        $catFoodamount -= 1
    else
        catHunger = true
    end

end

if out_of_food
    puts( "You have no cat food left.\nGo get some!" )
end