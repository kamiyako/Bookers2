class RelationshipsController < ApplicationController
  # フォローするとき
  def create
    follower = current_user.relationships.new(followed_id: params[:user_id])
    follower.save
    redirect_to request.referer
  end
  # フォロー外すとき
  def destroy
    follower = current_user.relationships.find_by(followed_id: params[:user_id])
    follower.destroy
    redirect_to request.referer  
  end
  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
