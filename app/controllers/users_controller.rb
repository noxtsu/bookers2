class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = Book.find(params[:id])
  end
  

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    
  end
  
  
end
