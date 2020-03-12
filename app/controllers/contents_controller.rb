class ContentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  def index
    @contents = Content.all.select("id, title")
    render :json => @contents
  end

  def image
    @content = Content.find(params[:id])
    send_data @content.image, filename: @content.title, :type => 'image/jpeg', :disposition => 'inline'
  end

  def sound
    @content = Content.find(params[:id])
    send_data @content.sound, filename: @content.title, :type => 'audio/mp3', :disposition => 'inline'    
  end

  def current
    @num = params[:num].to_i
    @contents = Content.limit(@num).order(created_at: "DESC").select("id, title")
    render :json => @contents
  end

  def resister
    @image = params[:image]
    @sound = params[:sound]
    data = {
      "user_id":params[:user_id],
      "title":params[:title],
      "image":@image.read,
      "sound":@sound.read
    }
    @content = Content.new(data)
    if @content.save
      result = {"status": "success", "id": @content.id}
    else
      result = {"status": "failed"}
    end
    render :json => result
  end

  def fav
    contents = []
    @count = params[:data]
    @count.each do |c|
      @content = Content.find(c.to_i).select("id, title")
      contents.append(@content)
    end
    render :json => contents
  end

  def search
    t = "%" + params[:title] + "%"
    @contents = Content.where("title LIKE ?", t).select("id, title")
    render :json => @contents
  end

  def watch
    @content = Content.where(id: params[:id]).select("id, title")
    @contents = Content.order("RANDOM()").limit(10).select("id, title")
    data = {"main": @content, "other": @contents}
    render :json => data
  end

  def home
    @contents = Content.where(user_id: params[:id]).select("id, title")
    render :json => @contents
  end
end