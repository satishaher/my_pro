class SongController < ApplicationController
  
  before_filter :find_user_song , :only => [:show, :edit, :update, :delete, :destroy]
  skip_before_filter :check_session, :only=> [:login ,:register]
  before_filter :check_session
 # skip_before_filter :check_session, :only=> [:login ,:register]
  def new
     @song =Song.new(:gener => "unknown")
     @user = User.find(session[:user_id])
  end
  
  def list
     @user = User.find(session[:user_id])
     @songs =@user.songs   
  end
  
  def create
    @song =Song.new(params[:song])
    @user = User.find(session[:user_id])    
            if @song.valid?
              @user.songs << @song
              redirect_to(:action => 'list')
              flash[:notice] = "song added to your list"
            else
              redirect_to(:action => 'new')
               if @song && @song.errors.size > 0 
                 flash[:notice] = @song.errors.full_messages
               end
            end
  end

  def update    
    if @song.update_attributes(params[:song])
      redirect_to(:action => 'show',:id=> @song.id)
      flash[:notice] = "details of "+@song.name+" updated"
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
        if @song.destroy
          redirect_to(:action => 'list')
          flash[:notice] = "one record deleted... "
        else
          redirect_to(:action => 'delete')
          flash[:notice] = "record not deleted please try again..."
        end     
  end
  
  
    protected    
    def find_user_song
      @user = User.find(session[:user_id])
      @song = Song.find(params[:id])      
    end
    
     def check_session
       if session[:user_id].nil?
       flash[:notice] = "please login"  
       redirect_to(:controller => 'users',:action => 'login')# ,:id=> @user.id)
       end       
     end
  
end
