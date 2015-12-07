class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name, :limit => 25
      t.string :last_name, :limit => 50
      t.string :email, :default => "", :null => false
      t.string :country
      t.string :username, :limit => 40, :null => false
      t.string :password_digest
      t.text :description, :limit => 150
      t.boolean :admin, :default => false
      t.timestamps null: false
    end
  end
end
