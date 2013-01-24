class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @question = Question.paginate(page: params[:page], :per_page => 10)
      #@feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
