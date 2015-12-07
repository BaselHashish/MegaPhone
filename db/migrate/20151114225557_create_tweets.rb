class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :user_id
      t.string :username
      t.string :tweet, :limit => 150
      t.decimal :lat, :precision => 16, :scale => 2
      t.decimal :lon, :precision => 16, :scale => 2
      t.string :country
      t.integer :amp, :default => 1
      t.timestamps null: false
    end
    add_index("tweets", "user_id")
    add_index("tweets", "username")
  end
end
