class Admin::BooksController < Admin::BaseController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :set_users, only: [:update, :edit, :create, :new]
  before_action :set_categories, only: [:update, :edit, :create, :new]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to admin_books_path
    else
      flash.now[:error] = @book.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to admin_book_path(@book)
    else
      flash.now[:error] = @book.errors.full_messages.join(". ")
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

  def set_users
    @users = User.all
  end

  def set_categories
    @categories = Category.all
  end
end
