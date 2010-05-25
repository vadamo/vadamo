class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
#      @micropost = Micropost.new
      @artwork = Artwork.new
#      @feed_items = current_user.feed.paginate(:page => params[:page])
      @artwork_feed_items = current_user.artwork_feed.paginate(:page => params[:page])
    end
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title  = "Help"
  end

  def privacy_policy
    @title = "Privacy Policy"
  end

  def terms_of_use
    @title = "Terms of Use"
  end
end
