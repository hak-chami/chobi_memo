class WordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_word, only: [:show, :destroy, :edit, :update]

  def index
    @words = Word.search(current_user, params[:search]).order(created_at: :desc).page(params[:page]).per(24)
  end

  def new
    @word = current_user.words.new
  end

  def create
    @word = current_user.words.new(words_params)
    @word.content_replace = Word.text_conversion(words_params[:content])
    if @word.save
      redirect_to words_path, notice: '単語を登録しました！'
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
    @word.destroy
    redirect_to words_path, alert: '単語を削除しました'
  end

  def edit
  end

  def update
    @word.content_replace = Word.text_conversion(words_params[:content])
    if @word.update(words_params)
      redirect_to word_path, notice: '単語を編集しました！'
    else
      render 'edit'
    end
  end

  private

  def words_params
      params.require(:word).permit(:word, :kana, :content)
  end

  def set_word
    @word = current_user.words.find_by(id: params[:id])
  end
  
end
