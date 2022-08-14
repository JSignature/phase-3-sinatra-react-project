class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
 

 

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
      dog_image:  "https://placedog.net/250/250/?id=#{rand(0..150)}"
    )
    new_dog.to_json
  
  end

  get "/clients/view/:id" do
    clients = Client.find(params[:id])

    clients.to_json(include: {dogs: { only: [:dog_name, :dog_image, :dog_breed, :id]}})
  end

  get "/dogs/view/:id" do
    dog = Dog.find(params[:id])
    dog.to_json(include: {client: { only: [:client_first_name]}})
  end

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





