class BooksController < ApplicationController
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id), notice: "Book was successfully created."
  end
  
  def index
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
