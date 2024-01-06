class Bird
    attr_accessor :name
    attr_accessor :species

	# Initializes a new instance of the class.
	#
	# @param [String] aName - The name of the object.
	# @param [String] aSpecies - The species of the object.
	# @return [void]
	def initialize( aName, aSpecies )
        @name = aName
        @species = aSpecies
    end

    # Capitalizes the name and returns it.
    def name
        return @name.capitalize
    end

    # Capitalizes the value of the `@species` instance variable.
    def species
        return @species.capitalize
    end
end

newbird1 = Bird.new('George Wintershoes', 'Goose')
newbird2 = Bird.new('Quackington The Third', 'Duck')
newbird3 = Bird.new('Alice McDinnertable', 'Goose')
newbird4 = Bird.new('Betty Snapbottom', 'Duck')

h1 = {
	newbird1.name =>newbird1.species,
	newbird2.name=>newbird2.species,
	newbird3.name=>newbird3.species,
	newbird4.name=>newbird4.species
	}

h2 = {'Goose shed'=>'coop', 'Duck coop'=>'coop', 'Chicken coop'=> 'coop'}
h3 = {'Pasture by the pond'=>'pasture', 'Pasture in the garden'=>'pasture', 'Winter pasture'=> 'pasture'}

hnew = (h2.merge(h3))

# Sorts the elements of a hash in ascending order based on their string representation.
#
# Parameters:
# - aHash: The hash to be sorted.
#
# Returns:
# - The sorted hash.

def sorted_hash( aHash )
	return aHash.sort{
		|a,b|
			a.to_s <=> b.to_s
		}
end

puts( "\nAreas:\n" )
p( sorted_hash(hnew) )
puts( "\nBirds:\n" )
p( sorted_hash(h1) )

puts( "\nadd bird:" )
puts( "\nGoose, Duck, or Chicken?\n" )
birdspecies = gets.chop
puts( "Whats their name?\n" )
namebird = gets.chop

addbird = Bird.new(namebird, birdspecies)
h1[addbird.name] = addbird.species

p( sorted_hash(h1) )
