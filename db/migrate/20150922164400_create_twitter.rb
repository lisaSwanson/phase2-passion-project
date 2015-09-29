class CreateTwitters < ActiveRecord::Migration
  def change
  	create_table :twitter do |t|
      t.integer :uid
      t.integer :token
      t.integer :secret
      t.string :nickname 
      t.string :name 
      t.string :email
      t.string :location
      t.string :image 
      t.string :description
      t.string :url_website
      t.string :url_twitter
      t.integer :followers
  		t.timestamps
  	end
  end
end