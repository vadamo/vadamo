class PicturesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy] 
  before_filter :authorized_artwork, :only => [:create]
  before_filter :authorized_user, :only => [:destroy]
  
  def create
    @picture = Picture.create( params[:picture] )

    if @picture.save 
      flash[:notice] = 'Picture created!' % params[:picture][:artwork_id]
      redirect_to root_path
    else
      flash[:notice] = 'Picture creation failed'
      redirect_to root_path
    end
  end

  def destroy
    @picture.destroy
    redirect_back_or root_path
  end

  def show
    @picture = Picture.find(params[:id])
    @artwork = Artwork.find(@picture.artwork_id)
  end

#   def index
#     @title = "All pictures"
#     @pictures = Picture.paginate(:page => params[:page])
#   end

  private
  
    def authorized_user
      @picture = Picture.find(params[:id])
      redirect_to root_path unless current_user.id == @picture.user_id
    end

    def authorized_artwork
      @artwork = Artwork.find(params[:picture][:artwork_id])
      flash[:notice] = "fuck"
      redirect_to root_path unless current_user.id == @artwork.user_id
    end

end
