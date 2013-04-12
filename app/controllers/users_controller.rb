class UsersController < ApplicationController
  
  before_filter :check_session
  skip_before_filter :check_session, :only=> [:login ,:register ,:login_me,:create]
  #before_filter   :login_required, :except => [:welcome,:login]
  def new
    @user =User.new(params[:user])
  end

def create
    
     @user =User.new(params[:user])
     if @user.save
       flash[:notice] = "your account is created you can now login"
       redirect_to(:action => 'login')
       
     else       
         
       render(:controller => 'users',:action => 'register')  
                       
     end
 end #end of create
 
  def update
  end
   def logout
     session[:user_id]=nil
     session[:email]=nil
     flash[:notice] = "logout successfully..."
     redirect_to(:controller => 'users',:action => 'login')
   end
  
  def register
     if session[:user_id].nil?
       @user=User.new 
       
     else
       flash[:notice] = "you are already login as #{session[:email]} logout before register" 
       redirect_to(:controller => 'movie',:action => 'list')
      end 
          
  end

  def delete
  end
  def list
    @users=User.all
  end
    def showlogin
    end
  
   def login 
       if !session[:user_id].nil?
       flash[:notice] = "you are already login as "+session[:email]+" logout first"  
       redirect_to(:controller => 'movie',:action => 'list')
       end  
   end 
   
     def login_me
                    user = User.authenticate(params[:email],params[:password])
                    if user=="string"
                       flash[:notice] = "Password not valide !!!!!"  
                       redirect_to(:controller => 'users',:action => 'login')                   
                    else           
                        if user 
                          session[:user_id]=user.id
                          session[:email]=user.email                   
                          redirect_to(:controller => 'movie',:action => 'list')
                          flash[:notice] = "Welcome  "+user.f_name
                        else
                           flash[:notice] = "user not valide !!!!!"  
                          redirect_to(:controller => 'users',:action => 'login')                                        
                        end
                    end     
     end
     
     protected 
     def check_session
       if session[:user_id].nil?
       flash[:notice] = "please login"  
       redirect_to(:controller => 'users',:action => 'login')
       end       
     end
   def error_message object
    
    render :partial=>'_error_messages'
    
  end
   
   
   
   
end
