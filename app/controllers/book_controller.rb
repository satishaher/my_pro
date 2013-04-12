class BookController < ApplicationController
  before_filter :find_user_book , :only => [:show, :edit, :update, :delete, :destroy]
   before_filter :check_session
   skip_before_filter :check_session, :only=> [:login ,:register]
  def new
     @book =Book.new(:gener => "unknown")
      @user = User.find(session[:user_id])
  end
  
  def list
     @user = User.find(session[:user_id])
     @books =@user.books   
  end
  
  def create
    @book =Book.new(params[:book])
      @user = User.find(session[:user_id])
    
    if @book.valid?
      @user.books << @book
      redirect_to(:action => 'list')
      flash[:notice] = "book added to your list"
    else
      redirect_to(:action => 'new')
       if @book && @book.errors.size > 0 
         flash[:notice] = @book.errors.full_messages
       end
    end
  end

  def update  
    if @book.update_attributes(params[:book])
      redirect_to(:action => 'show',:id=> @book.id)
      flash[:notice] = "details of "+@book.name+" updated"
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
    if @book.destroy
      redirect_to(:action => 'list')
      flash[:notice] = "one record deleted... "
    else
      redirect_to(:action => 'delete')
      flash[:notice] = "record not deleted please try again..."
    end     
  end
  
   protected    
    def find_user_book
      @user = User.find(session[:user_id])
      @book = Book.find(params[:id])      
    end
    def check_session
       if session[:user_id].nil?
       flash[:notice] = "please login"  
       redirect_to(:controller => 'users',:action => 'login')# ,:id=> @user.id)
       end       
     end
  
end
