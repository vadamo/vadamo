class ArtworksController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy] 
  before_filter :authorized_user, :only => :destroy

  def create
    @artwork = current_user.artworks.build(params[:artwork])
    if @artwork.save
      flash[:success] = 'Artwork created!'
      redirect_to root_path
    else
      @artwork_feed_items = []
      render 'pages/home'
    end
  end

  def destroy
    @artwork.destroy
#     artwork = Artwork.find(params[:id]).destroy
#     flash[:success] = "Artwork destroyed."
    redirect_back_or root_path
  end

  def show
    @artwork = Artwork.find(params[:id])
    @title = 'your artwork number %d' % params[:id]
    @picture = @artwork.pictures.build
#   @picture.artwork_id = @artwork.id
  end

  def index
    @title = "All artwork"
#    @artworks = Artwork.pginate(:page => params[:page])
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end  

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update_attributes(params[:artwork])
      flash[:success] = "Artwork updated."
      redirect_to @artwork
    else
      @title = "Edit artwork"
      render 'edit'
    end
  end

  private
  
    def authorized_user
      @artwork = Artwork.find(params[:id])
      redirect_to root_path unless current_user?(@artwork.user)
    end
end
