class Book < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :author , :gener
 belongs_to :user
 validates_presence_of :name
 #validate :all_blank?
#def  all_blank?
#if (self.name.blank?)
 #     errors.add(:name, "please enter name.............,,,,,,,,,,")
  #    return true
   # else
   #  return false
   # end
#end

end
