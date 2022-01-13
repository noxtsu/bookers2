class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
    @book_new = Book.new
    @book = Book.find(params[:id])
    @book.save
    redirect_to user_path(@user.id), notice: "Book was successfully created."
  end
  

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  
end
