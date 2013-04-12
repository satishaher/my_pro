class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      
      t.integer "user_id"
t.string "name"
t.string "author"
t.string "gener"
      t.timestamps
    end
  end
end
