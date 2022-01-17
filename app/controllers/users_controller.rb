class UsersController < ApplicationController

  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = Book.all
    @books = Book.find(params[:id])
    #@book.save
    #redirect_to user_path(@user.id), notice: "Book was successfully created."
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

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
