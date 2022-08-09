class CreateClients < ActiveRecord::Migration[6.1]
  def change
    create_table :clients do |t|
      # id will be added by DB
      t.string :client_first_name 
      t.string :client_last_name 
      t.string :client_address_street 
      t.string :client_address_city 
      t.string :client_address_state 
      # Not sure about the - so leaving as a string
      t.string :client_address_zip 
      t.string :client_phone 
      
      t.string :client_email 
      t.string :client_image 
      t.timestamps
    end
  end
end
