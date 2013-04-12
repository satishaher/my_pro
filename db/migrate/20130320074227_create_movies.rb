class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      
     t.integer "user_id"
t.string "name"
t.string "desc"
t.string "gener"
      t.timestamps
    end
  end
end
