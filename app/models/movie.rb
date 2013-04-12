class Movie < ActiveRecord::Base
 
   attr_accessible :name, :desc , :gener
 belongs_to :user
 validates_presence_of :name
  
end
