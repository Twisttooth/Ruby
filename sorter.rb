# define Thing superclass, for all Things
class Thing
  attr_accessor( :name, :description )
  @@num_things = 0
  
  def initialize( aName, aDescription )
    @name = aName.capitalize
    @description = aDescription
    @@num_things += 1
    puts( "Thing.initialize: #{self.inspect}\n\n" )
  end

  def things
    return @@num_things
  end

  def things=(num)
    @things = num
  end

end

# define Place class for coops and pastures
class Place < Thing

  def initialize( aName, aDescription, sizeIs, predatorProof )
    super( aName, aDescription )
    @size = sizeIs
    @predator_proof = predatorProof
    puts( "init.Place: #{self.inspect}\n\n" )
  end

end

# define class for Birds
class Bird < Thing
  
  def initialize( aName, aDescription, isSpecies )
    super( aName, aDescription )
    @species = isSpecies
    puts( "init.Bird: #{self.inspect}\n\n" )
  end

end

# def menu options
def status_menu()
  luku = Thing.new("things", "amount of things")

  puts( "Farm Status" )
  puts( "Things around the farm: #{(luku.things - 1) / 2}\n\n" )

  puts( "Untitled goose sorter.\n\n" )
  puts( "1. Status\n2. Manage birds\n3. Manage farm areas\n\n" )
end

# bird manage menu
def bird_menu()
  ans = ''
  puts( "Manage birds\n\n" )
  puts( "1. Add Bird\n2. Remove Bird\n3. Move Bird\n\n" )
  until ans == 'b' do  
    puts( "[ Enter 1, 2, 3 or 'b'? ]" )
    print( "> " )
    ans = gets[0].chr().downcase()
    
    case ans 
      when '1' then
        ch = ''
        puts( "Goose, duck, or Chicken?" )
        puts( "1. Goose\n2. Duck\n3. Chicken" )
        until ch == 'b' do
          puts( "[ Enter 1, 2, 3 or 'b'? ]" )
          print( "> " )
          ch = gets[0].chr().downcase()
          
          case ch
            when '1' then
              puts( "Name your goose: " ) 
              name = gets
              puts( "Describe your goose: " )
              description = gets
              goose = Bird.new(name, description, "goose")
              puts("Goose: #{goose.inspect}")

            when '2' then
              puts( "Name your duck: " ) 
              name = gets
              puts( "Describe your duck: " )
              description = gets
              duck = Bird.new(name, description, "duck")
              puts("Duck: #{duck.inspect}")

            when '3' then puts( "Chicken" )
              puts( "Name your chicken: " ) 
              name = gets
              puts( "Describe your chicken: " )
              description = gets
              chicken = Bird.new(name, description, "chicken")
              puts("Chicken: #{chicken.inspect}")

          end
          puts( "Goose, duck, or Chicken?" )
          puts( "1. Goose\n2. Duck\n3. Chicken" )
        end
        puts( "Manage birds\n\n" )
        puts( "1. Add Bird\n2. Remove Bird\n3. Move Bird\n\n" )
      when '2' then puts( "remove" )
      when '3' then puts( "move" )
    end	  
  end
  
  puts( "Untitled goose sorter.\n\n" )
  puts( "1. Status\n2. Manage birds\n3. Manage farm areas\n\n" )
end

# farm manage menu
def farm_menu()
  ans = ''
  puts( "Manage farm\n\n" )
  puts( "1. Add coop\n2. Remove coop\n3. Move coop\n\n" )
  until ans == 'b' do  
    puts( "[ Enter 1, 2, 3 or 'b'? ]" )
    print( "> " )
    ans = gets[0].chr().downcase()
    
    case ans 
      when '1' then puts( "add" )
        puts( "Name your coop: " ) 
        name = gets
        puts( "Describe your coop: " )
        description = gets
        coop = Place.new(name, description, 20, TRUE)
        puts("New Coop: #{coop.inspect}")

      when '2' then puts( "remove" )
      when '3' then puts( "move" )
    end	  
  
  end
  puts( "Untitled goose sorter.\n\n" )
  puts( "1. Status\n2. Manage birds\n3. Manage farm areas\n\n" )
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
	when '1' then status_menu()
	when '2' then bird_menu()
	when '3' then farm_menu()
  end	  
end 