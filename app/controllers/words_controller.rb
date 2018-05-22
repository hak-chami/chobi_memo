class WordsController < ApplicationController
  def index
    @user = current_user
    @words = @user.words.page(params[:page]).per(24)
  end
end
