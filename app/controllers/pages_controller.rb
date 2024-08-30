class PagesController < ApplicationController
  def home
    @posts = Post.order(created_at: :desc).limit(10) # Muestra los 10 posts más recientes
  end

  def about
  end

  def contact
  end
end
