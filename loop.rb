# 'main' loop
ans = ''
puts( "Run Test 1, 2, 3, 4, 5?\nWrite a number or 'q' to quit. Then press [Enter] key\n\n" )
until ans == 'q' do  
  puts( "[ Enter 1, 2, 3, 4, 5 or 'q'? ]" )
  print( "> " )
  ans = gets[0].chr().downcase()
  case ans 
	when '1' then test1()
	when '2' then test2()
	when '3' then test3()
	when '4' then test4()
	when '5' then test5()
  end	  
end 