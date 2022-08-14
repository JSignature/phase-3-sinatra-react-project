# Faker::Name.first_name       #=> "Kaci"
# Faker::Name.last_name        #=> "Ernser"
# Faker::Address.street_address #=> "282 Kevin Brook"
# Faker::Address.city #=> "Imogeneborough"
# Faker::Address.state_abbr #=> "AP"
# Faker::Address.zip #=> "58517" or "66259-8212"
# Faker::PhoneNumber.cell_phone #=> "(186)285-7925"
# Faker::Internet.safe_email #=> "christelle@example.org"
# https://i.pravatar.cc/300?img=7 (rand(1..20))


# Faker::Creature::Dog.name #=> "Spike"
# Faker::Creature::Dog.breed #=> "Yorkshire Terrier"
# Faker::Creature::Dog.size #=> "small"
# Weight
# Faker::Creature::Dog.gender #=> "female"
# Faker::Creature::Dog.coat_length #=> "short"
# Faker::LoremFlickr.image(size: "50x60", search_terms: ['sports'])


puts "🌱 Seeding spices..."

10.times do
    
    Client.create(
    client_first_name: Faker::Name.first_name,
    client_last_name: Faker::Name.last_name,
    client_address_street: Faker::Address.street_address,
    client_address_city: Faker::Address.city,
    client_address_state: Faker::Address.state_abbr,
    client_address_zip: Faker::Address.zip,
    client_phone: Faker::PhoneNumber.cell_phone,
    client_email: Faker::Internet.safe_email,
    client_image: "https://i.pravatar.cc/300?img=#{rand(0..60)}"
    )
  end

  15.times do
    Dog.create(
     dog_name: Faker::Creature::Dog.name,
     dog_breed: Faker::Creature::Dog.breed,
     dog_size: Faker::Creature::Dog.size,
     dog_weight: (rand(1..90)),
     dog_gender: Faker::Creature::Dog.gender,
     dog_coat_length: Faker::Creature::Dog.coat_length,
     dog_image: "https://placedog.net/250/250/?id=#{rand(0..150)}",
    #  Used the random with the range of clients
     client_id: (rand(1..10))
    )


  end



puts "✅ Done seeding!"
