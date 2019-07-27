class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  before_action :set_sentence, only: [:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.all
    @sentences = Sentence.all
  end

  def show
    if logged_in?
      @favorite = current_user.favorites.find_by(picture_id: @picture.id)
    end
  end

  def new
    if params[:back]
      @picture = current_user.pictures.build(picture_params)
      @sentence = current_user.sentences.build(sentence_params)
    else
      @picture = Picture.new
      @sentence = Sentence.new
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
    @sentence = current_user.sentences.build(sentence_params)

    # render :new if @sentence.invalid? || @picture.invalid?

    # "渡すフォーマットの設定"
    # respond_to do |format|
      # "@sentenceまたは@pictureにバリテーションが発生した場合"
    #   if @sentence.invalid? || @picture.invalid?
    #     # "render :newさせる"
    #     format.html { render :new }
    #     # "渡すフォーマットにjson（配列）を指定"
    #     # "jsonにエラーを格納"
    #     # "ステータスコードにエラー422を指定"
    #     # format.json { render json: (@picture.errors), status: :unprocessable_entity }
    #     format.json { render json: @sentence.errors, status: :unprocessable_entity}
    #   else
    #
    #   end
    # end
    if @sentence.invalid? || @picture.invalid?
      if @sentence.invalid?
       flash[:errors] = @sentence.errors.full_messages
      end

      if @picture.invalid?
        flash[:errors] = @picture.errors.full_messages
      end
        render :new
      else
    end
    # render :new if @sentence.invalid? || @picture.invalid?
    # render :new if @picture.invalid?
    # respond_to do |format|




    # if @picture.invalid?
    #   @sentece.invalid?
    #   render :new
    # else
    #   @sentece.invalid?
    #   render :new
    # end
    # render :new if @picture.invalid? || @sentence.invalid?
    # render :new if or @sentence.invalid?
    # if @picture.invalid? || @sentence.invalid?
    #   flash[:errors] = @picture.errors.full_messages.concat @sentence.errors.full_messages
    #   render :new
    # end
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    @sentence = current_user.sentences.build(sentence_params)

    respond_to do |format|
      if @picture.save && @sentence.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
        # format.json { render json: @sentence.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @picture.update(picture_params) && @sentence.update(sentence_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
        # format.json { render json: @sentence.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @picture.destroy && @sentence.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_picture
      @picture = Picture.find(params[:id])
    end

    def set_sentence
      @sentence = Sentence.find(params[:id])
    end

    def picture_params
      params.require(:picture).permit({images: []}, :images_cache)
    end

    def sentence_params
      params.require(:sentence).permit(:content)
    end
end
