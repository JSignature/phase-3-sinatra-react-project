class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  

  get "/" do
    { message: "This is the homepage" }.to_json
  end

  get "/clients/list" do
    clients = Client.all
    clients.to_json(include: {dogs: { only: [:dog_name]}})
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

  get "/clients/view/:id" do
    clients = Client.find(params[:id])
    clients.to_json(include: {dogs: { only: [:dog_name]}})
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
    client.to_json(include: {dogs: { only: [:dog_name]}})
  end

  delete "/clients/delete/:id" do
    client_to_delete = Client.find(params[:id])
    client_to_delete.destroy
    client_to_delete.to_json
  end
  
  end





