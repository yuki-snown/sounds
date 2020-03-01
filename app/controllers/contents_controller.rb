class ContentsController < ApplicationController
  before_action :set_content, only: [:show, :edit, :update, :destroy]

  # GET /contents
  # GET /contents.json
  def index
    @contents = Content.all
    render :json => @contents
  end

  def current
    @num = params[:num].to_i
    @contents = Content.limit(@num).order(created_at: "DESC")
    render :json => @contents
  end

  # GET /contents/1
  # GET /contents/1.json
  def show
  end

  def resister
    data = {
      "user_id":params[:user_id],
      "title":params[:title],
      "image":params[:image],
      "sound":params[:sound]
    }
    @content = Content.new(data)
    if @content.save
      result = {"status": "success"}
    else
      result = {"status": "failed"}
    end
    render :json => result
  end

  def fav
    contents = []
    @count = params[:data]
    @count.each do |c|
      @content = Content.find(c.to_i)
      contents.append(@content)
    end
    render :json => contents
  end

  def search
    t = "%" + params[:title] + "%"
    @contents = Content.where("title LIKE ?", t)
    render :json => @contents
  end

  def watch
    @content = Content.find(params[:id])
    @contents = Content.order("RANDOM()").limit(10)
    data = {"main": @content, "other": @contents}
    render :json => data
  end

  def home
    @contents = Content.where(user_id: params[:id])
    render :json => @contents
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents
  # POST /contents.json
  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: 'Content was successfully created.' }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1
  # PATCH/PUT /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: 'Content was successfully updated.' }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1
  # DELETE /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: 'Content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:user_id, :title, :image, :sound)
    end
end
