class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(insta_id: params[:insta_id])
    redirect_to instas_url, notice: "#{favorite.insta.user.name}'s picture Liked"
  end

  def destroy
    favorite = current_user.favorites.find_by(insta_id: params[:insta_id]).destroy
    redirect_to instas_url, notice: "#{favorite.insta.user.name}'s picture UnLiked"
  end
end
