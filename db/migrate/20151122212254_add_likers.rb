class AddLikers < ActiveRecord::Migration
  def change
    add_column :tweets, :voters, :text
  end
end
