puts "🌱 Seeding spices..."

30.times do
    
    Client.create(
    client_first_name: Faker::Name.first_name,
    client_last_name: Faker::Name.last_name,
    client_address_street: Faker::Address.street_address,
    client_address_city: Faker::Address.city,
    client_address_state: Faker::Address.state_abbr,
    client_address_zip: Faker::Address.zip,
    client_phone: Faker::PhoneNumber.cell_phone,
    client_email: Faker::Internet.safe_email,
    client_image: "https://i.pravatar.cc/200?img=#{rand(0..60)}"
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
     dog_image: Faker::LoremFlickr.image(size: "300x300", search_terms: ['dog']),
    #  Used the random with the range of clients
     client_id: (rand(1..10))
    )


  end



puts "✅ Done seeding!"
