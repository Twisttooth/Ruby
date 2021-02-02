class Bird
    attr_accessor :name
    attr_accessor :species

	def initialize( aName, aSpecies )
        @name = aName
        @species = aSpecies
    end
    
    def name
        return @name.capitalize
    end

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
	
h2 = {'Coop name1'=>'coop', 'Coop name2'=>'coop', 'Coop name3'=> 'coop'}
h3 = {'Pasture name1'=>'pasture', 'Pasture name2'=>'pasture', 'Pasture name3'=> 'pasture'}

hnew = (h2.merge(h3))

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

h1['new bird'] = 'a new born chick'

p( sorted_hash(h1) )