dogs_and_breeds = [
  ['Byron', 'poodle'],
  ['The Shithead', 'Annoying Fucking Mutt'],
  ['Jordan', "Shiba Inu"]]

dogs_and_breeds.each do |name, breed|
  puts "Adding #{name}"
  Dog.create breed: breed, name:name
end
