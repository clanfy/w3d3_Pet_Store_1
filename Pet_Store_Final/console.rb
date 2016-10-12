require_relative('./models/pet_store')
require_relative('./models/pets')

require('pry-byebug')

petcetera = PetStore.new({'name' => "Petcetera", 'address' => "Vancouver, B.C. Canada", 'type' => "house pets"})
fish_r_us = PetStore.new({'name' => "Fish R Us", 'address' => "Edinburgh, Scotland, UK", 'type' => "fish"})

petcetera.save()
fish_r_us.save()

pet1 = Pet.new({'name' => "Minnie", 'type' => "cat", 'pet_store_id' => petcetera.id})
pet2 = Pet.new({'name' => "Gill-bert", 'type' => "fish", 'pet_store_id' => fish_r_us.id})
pet3 = Pet.new({'name' => "Bowser", 'type' => "dog", 'pet_store_id' => petcetera.id})
pet4 = Pet.new({'name' => "Nemo", 'type' => "fish", 'pet_store_id' => fish_r_us.id})


pet1.save()
pet2.save()
pet3.save()
pet4.save()



binding.pry
nil