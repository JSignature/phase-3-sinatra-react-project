class DogsController < ApplicationController



 get "/dogs/list" do
    dogs = Dog.all
    dogs.to_json
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

  get "/dogs/view/:id" do
    dog = Dog.find(params[:id])
    dog.to_json(include: {client: { only: [:client_first_name]}})
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

  delete "/dogs/delete/:id" do
    dog_to_delete = Dog.find(params[:id])
    dog_to_delete.destroy
    dog_to_delete.to_json
  end

end