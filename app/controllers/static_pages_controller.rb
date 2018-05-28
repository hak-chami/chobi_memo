class StaticPagesController < ApplicationController
  def home
    redirect_to words_path if user_signed_in?
  end
end
