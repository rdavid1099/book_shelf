class Admin::BooksController < Admin::BaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @users = User.all
    @categories = Category.all
    @book = Book.new
  end

  def create
    @users = User.all
    @categories = Category.all
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path
    else
      render :new
    end
  end

  def edit
    @users = User.all
    @categories = Category.all
  end

  def update
    @users = User.all
    @categories = Category.all
    if @book.update(book_params)
      redirect_to admin_book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to admin_books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :quantity, :price, :category_id, :user_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
