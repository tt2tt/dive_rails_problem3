class FavoritesController < ApplicationController
  def index
    @user = current_user.id
    @favorites = Favorite.where(user_id: @user).all
  end

  def create
    favorite = current_user.favorites.create(picture_id: params[:picture_id])
    redirect_to pictures_path, notice: "#{favorite.picture.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to pictures_url, notice: "#{favorite.picture.user.name}さんのブログをお気に入り解除しました"
  end
end
