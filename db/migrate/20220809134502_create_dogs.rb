class CreateDogs < ActiveRecord::Migration[6.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name 
      t.string :dog_breed 
      t.string :dog_size 
      t.integer :dog_weight 
      t.string :dog_gender 
      t.string :dog_coat_length 
      t.string :dog_image 
      t.integer :client_id 
      t.timestamps
    end
  end
end
