class UsersController < ApplicationController
before_action :ensure_correct_user, only:[:edit]

   def ensure_correct_user
    @user = User.find(params[:id])
     unless @user == current_user
     redirect_to users_path
     end
   end

  def index
    @users = User.all
    @book_new = Book.new
  end

  def show
    @users = User.all
    @user = User.find(params[:id])
    @book_new = Book.new
    @books = @user.books
    #@book.save
    #redirect_to user_path(@user.id), notice: "Book was successfully created."
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
