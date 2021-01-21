def test1()
  puts( "test1" )
end

def test2()
  puts( "test2" )
end

def test3()
  puts( "test3" )
end

# 'menu' loop
ans = ''
puts( "Untitled goose sorter.\n\n" )
puts( "1. Status\n2. Manage birds\n3. Manage farm areas\n\n" )
until ans == 'q' do  
  puts( "[ Enter 1, 2, 3 or 'q'? ]" )
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