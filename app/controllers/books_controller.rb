class BooksController < ApplicationController
  before_action :require_login

  def require_login
    redirect_to login_path unless logged_in?
  end

  def index
    @books = current_user.books
  end

  def show
    @book = Book.find( params[:id] )
  end

  def new
    @categories = Category.all
    @book = Book.new
  end

  def edit
    @categories = Category.all
    @book = Book.find( params[:id] )
  end

  def create
    @categories = Category.all
    @book = current_user.books.new( book_params )
    if @book.save
      flash[:notice] = "You successfully created a book"
      redirect_to user_books_path(current_user)
    else
      flash.now[:error] = @book.errors.full_messages.join(", ")
      render :new
    end
  end

  def update
    @book = Book.find( params[:id] )
    if @book.update( book_params )
      redirect_to user_books_path(current_user)
    else
      flash.now[:error] = @book.errors.full_messages.join(", ")
      render :edit
    end
  end

  def destroy
    @book = Book.find( params[:id] )
    @book.destroy
    flash[:notice] = "You successfully removed the book from the shelf"
    redirect_to user_books_path(current_user)
  end

  private

  def book_params
    params.require(:book).permit(:title, :price, :quantity, :category_id)
  end
end
