class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
<<<<<<< HEAD

  get "/" do
    { message: "This is the homepage" }.to_json
  end
=======
  # Add your routes here
 

 
>>>>>>> contoller_setup

  get "/clients/list" do
    clients = Client.all
    clients.to_json(include: {dogs: { only: [:dog_name]}})
  end

  get "/dogs/list" do
    dogs = Dog.all
    dogs.to_json
  end

  
  
  post "/clients/add" do
    
    new_client = Client.create(
    client_first_name: params[:client_first_name],
    client_last_name: params[:client_last_name],
    client_address_street: params[:client_address_street],
    client_address_city: params[:client_address_city],
    client_address_state: params[:client_address_state],
    client_address_zip: params[:client_address_zip],
    client_phone: params[:client_phone],
    client_email: params[:client_email],
    client_image: "https://i.pravatar.cc/300?img=#{rand(0..60)}"
    )
    new_client.to_json
  end
  post "/dogs/add" do
    
    new_dog = Dog.create(
      dog_name: params[:dog_name],
      dog_breed: params[:dog_breed],
      dog_size: params[:dog_size],
      dog_weight: params[:dog_weight],
      dog_gender: params[:dog_gender],
      dog_coat_length: params[:dog_coat_length],
      client_id: params[:client_id],
      dog_image: Faker::LoremFlickr.image(size: "300x300", search_terms: ['dog'])
    )
    new_dog.to_json
  
  end

  get "/clients/view/:id" do
    clients = Client.find(params[:id])
    clients.to_json(include: {dogs: { only: [:dog_name]}})
  end

<<<<<<< HEAD
=======
  get "/dogs/view/:id" do
    dog = Dog.find(params[:id])
    dog.to_json
  end

>>>>>>> contoller_setup
  patch "/clients/edit/:id" do
    client = Client.find(params[:id])
    client.update(
      client_first_name: params[:client_first_name],
      client_last_name: params[:client_last_name],
      client_address_street: params[:client_address_street],
      client_address_city: params[:client_address_city],
      client_address_state: params[:client_address_state],
      client_address_zip: params[:client_address_zip],
      client_phone: params[:client_phone],
      client_email: params[:client_email]
    )
<<<<<<< HEAD
    client.to_json(include: {dogs: { only: [:dog_name]}})
=======
    client.to_json(include: {dogs: { only: [:dog_name, :dog_image]}})
  end

  patch "/dogs/edit/:id" do
    dog = Dog.find(params[:id])
    dog.update(
      dog_name: params[:dog_name],
  dog_breed: params[:dog_breed],
dog_size: params[:dog_size],
dog_weight: params[:dog_weight],
dog_gender: params[:dog_gender],
dog_coat_length: params[:dog_coat_length],
dog_image: params[:dog_image],
client_id: params[:client_id],    
    )
    dog.to_json
>>>>>>> contoller_setup
  end

  delete "/clients/delete/:id" do
    client_to_delete = Client.find(params[:id])
    client_to_delete.destroy
    client_to_delete.to_json
  end

  delete "/dogs/delete/:id" do
    
    dog_to_delete = Dog.find(params[:id])
    dog_to_delete.destroy
    dog_to_delete.to_json
  end
  
  end





