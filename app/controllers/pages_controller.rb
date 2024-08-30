class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(10)
    @most_used_hashtags = Post.most_used_hashtags
  end

  def about
  end

  def contact
  end
end
