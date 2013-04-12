class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      
      t.integer "user_id"
t.string "name"
t.string "artist"
t.string "gener"
      t.timestamps
    end
  end
end
