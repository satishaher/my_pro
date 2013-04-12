class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :email, :f_name,:l_name,:password,:password_confirmation
  has_many :movies
  has_many :songs
  has_many :books
  
  EMAIL =/^[A-Z0-9._%+-]+@[A-Z0-9,-]+\.[A-Z]{2,4}$/i
  
  validates_format_of :email, :with => EMAIL,:message =>  " is not valid!!!"
  
  validates_presence_of :email 
  validates_presence_of :f_name
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_confirmation_of :password
  
  before_create :hash_password

  def hash_password
    self.password = Digest::MD5.hexdigest(self.password)
  end
  
  def self.authenticate(email,pass)
       user = User.find_by_email(email)
       if user
           if user.password_match?(pass)
             return user
           else
             return "string"
           end
        else       
          return false   
       end
  end       
  def password_match?(pass="")
      self.password == Digest::MD5.hexdigest(pass)
  end

end
