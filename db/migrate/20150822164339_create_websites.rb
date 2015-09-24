class CreateWebsites < ActiveRecord::Migration
  def change
  	create_table :websites do |t|
  		t.string :social_media_link, null: false
  		t.string :api_key
  		t.integer :user_id, null: false

  		t.timestamps
  	end
  end
end
