class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.reverse_order
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
    redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:success] = 'Book was successfully updated.'
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction )
  end

end
