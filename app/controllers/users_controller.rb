class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @booknew = Book.new

    @books = @user.books.order('created_at DESC')


  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    flash[:notice] = "User info was successfully updated."
    redirect_to user_path(@user.id)
    else
    render :edit
    end
  end

  def index
    @users = User.all
    @user = current_user
    @booknew = Book.new
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end