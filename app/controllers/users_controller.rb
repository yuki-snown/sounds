class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all.select("id, username")
    render :json => @users
  end

  def auth
    @user = User.find_by(username: params[:username], password: params[:password])
    if @user.nil?
      data = {"status": "false"}
    else
      data = {"status": "true", "id": @user.id}
    end
    render :json => data
  end

  def add
    data = {
      "username":params[:username],
      "password":params[:password]
    }
    @user = User.new(data)
    if @user.save
      result = {"status": "success", "id": @user.id}
    else
      result = {"status": "failed"}
    end
    render :json => result
  end

  def home
    @user = User.find_by(username: params[:username])
    redirect_to controller: 'contents', action: 'home', id: @user.id
  end
end