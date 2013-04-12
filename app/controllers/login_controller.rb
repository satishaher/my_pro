class LoginController < ApplicationController
  
  
  def login
    
  end
  def login_me
    
     @user =User.new(params[:user])
     #redirect_to(:controller => 'book',:action => 'list')
  end

  def register
     @user =User.new(params[:user])
  end
  
  def create_user
    
     @user =User.new(params[:user])
     
     if @user.save
       redirect_to(:action => 'login')
       flash[:notice] = "user created"
     else       
       redirect_to(:controller => 'login',:action => 'register')
       
                        if @user && @user.errors.size > 0 
                          @user.errors.full_messages.each do |msg|
                            if !msg.nil?
                                  mess += msg.to_s 
                                  end
                                end
                        end
                               
       
       flash[:notice] = mess
     end
     
  end
  
end
