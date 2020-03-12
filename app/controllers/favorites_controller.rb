class FavoritesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def index
    @favorites = Favorite.all.select("id, user_id, content_id")
    render :json => @favorites
  end

  def add
    data = {
      "user_id":params[:user_id],
      "content_id":params[:content_id]
    }
    @favorite = Favorite.new(data)
    if @favorite.save
      result = {"status": "success"}
    else
      result = {"status": "failed"}
    end
    render :json => result
  end

  def search
    @favorites = Favorite.where(user_id: params[:user_id])
    data = []
    @favorites.each do |f|
      if f.content_id.nil? == false
        data.append(f.content_id)
      end
    end
    redirect_to controller: 'contents', action: 'fav', data: data
  end
end