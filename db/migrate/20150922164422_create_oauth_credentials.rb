class CreateClientTypes < ActiveRecord::Migration
  def change
  	create_table :client_types do |t|
  		t.integer :user_id, null: false
  		t.string :oauth_token, null: false
  		t.string :oauth_verifier, null: false
  		t.string :provider, null: false

  		t.timestamps
  	end
  end
end