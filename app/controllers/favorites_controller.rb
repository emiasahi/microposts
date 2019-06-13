class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    #@micropostとはならない
    # micropost = Micropost.find(params[:micropost_id])
    Favorite.create(micropost_id: params[:micropost_id], user_id: current_user.id)
    # favorite = Favorite.new
    # favorite.micropost_id = params[:micropost_id]
    # favorite.user_id = current_user.id
    # favorite.save
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    # micropost = Micropost.find(params[:micropost_id])
    # current_user.unlike(micropost)
    favorite = Favorite.find(params[:id])
    favorite.destroy
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
