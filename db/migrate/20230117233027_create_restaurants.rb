class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants, primary_key: :idRestaurant, :id => false do |t|
      t.string :idRestaurant
      t.integer :rating 
      t.string :name
      t.string :site
      t.string :email
      t.string :phone
      t.string :street
      t.string :city
      t.string :state
      t.float :lat
      t.float :lng
      t.st_point :coordinates, null: false, geographic: true
      t.timestamps
    end
    add_index :restaurants, :coordinates, using: :gist
  end
end
