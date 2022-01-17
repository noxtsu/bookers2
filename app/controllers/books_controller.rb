class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book_new = Book.new
    @users = User.all
  end
  
  def create
    @book_new = Book.new
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id), notice: "Book was successfully created."
  end
  

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])

  end
  
  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)    
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
