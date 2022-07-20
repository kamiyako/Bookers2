class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
    @books = @user.books   #1userの全てのbooks
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  

  
end