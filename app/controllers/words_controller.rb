class WordsController < ApplicationController
  def user
    @user = current_user
  end

  def index
    @words = self.user.words.page(params[:page]).per(24)
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

  private

  def words_params
      params.require(:word).permit(:word, :kana, :content)
  end
end
