class BooksController < ApplicationController

  before_action :current_user!, only: [:edit, :update]


  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
   @book_new = Book.new
   @book = Book.find(params[:id])
   @user = @book.user
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id

    if @book.save
    flash[:success] = 'Book was successfully created.'
    redirect_to book_path(@book)
    else
    @user = current_user
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:success] = 'Book was successfully updated.'
    redirect_to book_path(@book)
    else
    render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def current_user!
    @book = Book.find(params[:id])
    if @book.user != current_user
    redirect_to books_path
    end
  end

end