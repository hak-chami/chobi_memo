class WordsController < ApplicationController
  before_action :set_word, only: [:show, :destroy]

  def user
    @user = current_user
  end

  def index
    @words = self.user.words.order(created_at: :desc).page(params[:page]).per(24)
  end

  def new
    @words = self.user.words.new
  end

  def create
    @words = self.user.words.new(words_params)
    if @words.save
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

  private

  def words_params
      params.require(:word).permit(:word, :kana, :content)
  end

  def set_word
    @word = self.user.words.find_by(id: params[:id])
  end
end
