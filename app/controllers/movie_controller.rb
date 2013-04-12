class MovieController < ApplicationController
  
  before_filter :find_user_movie , :only => [:show, :edit, :update, :delete, :destroy]
   before_filter :check_session
   skip_before_filter :check_session, :only=> [:login ,:register]
  def new
     @movie =Movie.new(:gener => "unknown")
     @user = User.find(session[:user_id])
  end
  
  def list
     @user = User.find(session[:user_id])
     @movies =@user.movies   
  end
  
  def create
    @movie =Movie.new(params[:movie])
    @user = User.find(session[:user_id])
    
    if @movie.valid?
      @user.movies << @movie
      redirect_to(:action => 'list')
      flash[:notice] = "movie added to your list"
    else
      redirect_to(:action => 'new')
       if @movie && @movie.errors.size > 0 
         flash[:notice] = @movie.errors.full_messages
       end
    end
  end

  def update    
    if @movie.update_attributes(params[:movie])
      redirect_to(:action => 'show',:id=> @movie.id)
      flash[:notice] = "details of "+@movie.name+" updated"
    else
      redirect_to(:action => 'edit',:id => params[:id])
      flash[:notice] = "Name can't be blank"
    end  
  end

  def show
  end
  
  def edit
  end
   
  def delete
  end
  
  def destroy
     if @movie.destroy
      redirect_to(:action => 'list')
      flash[:notice] = "one record deleted... "
    else
      redirect_to(:action => 'delete')
      flash[:notice] = "record not deleted please try again..."
    end     
  end
   protected    
    def find_user_movie
      @user = User.find(session[:user_id])
      @movie = Movie.find(params[:id])      
    end
  def check_session
       if session[:user_id].nil?
       flash[:notice] = "please login"  
       redirect_to(:controller => 'users',:action => 'login')# ,:id=> @user.id)
       end       
     end
end
