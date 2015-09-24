class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name, null: false
  		t.string :last_name, null: false
  		t.string :email, null: false
  		t.string :birthday, null: false
  		t.string :gender, null: false 
  		t.string :password_hash, null: false

  		t.timestamps
  	end
  end
end
