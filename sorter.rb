# define Thing superclass, for all Things
class Thing
  attr_reader :name, :description
  @@num_things = 0

  def initialize(aName, aDescription)
    @name = aName.capitalize
    @description = aDescription
    @@num_things += 1
  end

  def things
    @@num_things
  end
end

# define Place class for coops and pastures
class Place < Thing
  def initialize(aName, aDescription, sizeIs, predatorProof)
    super(aName, aDescription)
    @size = sizeIs
    @predator_proof = predatorProof
  end
end

# define class for Birds
class Bird < Thing
  def initialize(aName, aDescription, isSpecies)
    super(aName, aDescription)
    @species = isSpecies
  end
end

# def menu options
def status_menu
  luku = Thing.new("things", "amount of things")

  puts "Farm Status"
  puts "Things around the farm: #{(luku.things - 1) / 2}\n\n"

  puts "Untitled goose sorter.\n\n"
  puts "1. Status\n2. Manage birds\n3. Manage farm areas\n\n"
end

# bird manage menu
def bird_menu
  ans = ''
  puts "Manage birds\n\n"
  puts "1. Add Bird\n2. Remove Bird\n3. Move Bird\n\n"
  until ans == :b do
    puts "[ Enter 1, 2, 3 or 'b'? ]"
    print "> "
    ans = gets[0].chr.downcase.to_sym

    case ans
    when :1
      ch = ''
      puts "Goose, duck, or Chicken?"
      puts "1. Goose\n2. Duck\n3. Chicken"
      until ch == :b do
        puts "[ Enter 1, 2, 3 or 'b'? ]"
        print "> "
        ch = gets[0].chr.downcase.to_sym

        case ch
        when :1
          puts "Name your goose: "
          name = gets.chomp
          puts "Describe your goose: "
          description = gets.chomp
          goose = Bird.new(name, description, "goose")
          puts "Goose: #{goose.inspect}"

        when :2
          puts "Name your duck: "
          name = gets.chomp
          puts "Describe your duck: "
          description = gets.chomp
          duck = Bird.new(name, description, "duck")
          puts "Duck: #{duck.inspect}"

        when :3
          puts "Name your chicken: "
          name = gets.chomp
          puts "Describe your chicken: "
          description = gets.chomp
          chicken = Bird.new(name, description, "chicken")
          puts "Chicken: #{chicken.inspect}"
        end

        puts "Goose, duck, or Chicken?"
        puts "1. Goose\n2. Duck\n3. Chicken"
      end
      puts "Manage birds\n\n"
      puts "1. Add Bird\n2. Remove Bird\n3. Move Bird\n\n"

    when :2
      puts "remove"

    when :3
      puts "move"
    end
  end

  puts "Untitled goose sorter.\n\n"
  puts "1. Status\n2. Manage birds\n3. Manage farm areas\n\n"
end

# farm manage menu
def farm_menu
  ans = ''
  puts "Manage farm\n\n"
  puts "1. Add coop\n2. Remove coop\n3. Move coop\n\n"
  until ans == :b do
    puts "[ Enter 1, 2, 3 or 'b'? ]"
    print "> "
    ans = gets[0].chr.downcase.to_sym

    case ans
    when :1
      puts "add"
      puts "Name your coop: "
      name = gets.chomp
      puts "Describe your coop: "
      description = gets.chomp
      coop = Place.new(name, description, 20, true)
      puts "New Coop: #{coop.inspect}"

    when :2
      puts "remove"

    when :3
      puts "move"
    end
  end
  puts "Untitled goose sorter.\n\n"
  puts "1. Status\n2. Manage birds\n3. Manage farm areas\n\n"
end

# 'menu' loop
ans = ''
puts "Untitled goose sorter.\n\n"
puts "1. Status\n2. Manage birds\n3. Manage farm areas\n\n"
until ans == :q do
  puts "[ Enter 1, 2, 3 or 'q'? ]"
  print "> "
  ans = gets[0].chr.downcase.to_sym

  case ans
  when :1
    status_menu()
  when :2
    bird_menu()
  when :3
    farm_menu()
  end
end
