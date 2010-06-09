class ArtworksController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy] 
  before_filter :authorized_user, :only => :destroy

  def create
    @artwork = current_user.artworks.build(params[:artwork])
    if @artwork.save
      flash[:notice] = 'Artwork created!'
      redirect_to root_path
    else
      @artwork_feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @artwork.destroy
    redirect_back_or root_path
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def index
    @title = "All artwork"
    @artworks = Artwork.paginate(:page => params[:page])
  end

  private
  
    def authorized_user
      @artwork = Artwork.find(params[:id])
      redirect_to root_path unless current_user?(@artwork.user_id)
    end

end
