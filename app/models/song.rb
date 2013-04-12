class Song < ActiveRecord::Base
  # attr_accessible :title, :body
 attr_accessible :name, :artist , :gener
 belongs_to :user
 validates_presence_of :name
  
end
