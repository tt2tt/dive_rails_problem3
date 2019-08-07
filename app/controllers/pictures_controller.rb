class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
  end

  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(picture_id: @picture.id)
    end
  end

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
    else
      @picture = Picture.new
    end
  end

  def edit
    if current_user
      if current_user.id == @picture.user_id

      else
        redirect_to pictures_path
      end
    else
      redirect_to new_session_path
    end
  end

  def confirm
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  def create
    @picture = current_user.pictures.build(picture_params)

    respond_to do |format|
      if @picture.save
        PictureMailer.contribution_mail(@picture).deliver
        format.html { redirect_to @picture, notice: '投稿しました' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: '削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit({images: []}, :images_cache, :writing)
  end

end
