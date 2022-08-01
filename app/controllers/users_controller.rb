class UsersController < ApplicationController
   before_action :correct_user, only: [:edit, :update]

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

  def correct_user
    @user = User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

end