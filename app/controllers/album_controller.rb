class AlbumsController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy] 
  before_filter :authorized_user, :only => :destroy

  def create
    @album = current_user.albums.build(params[:album])
    if @album.save
      flash[:notice] = 'Album created!'
      redirect_to root_path
    else
      @album_feed_items = []
      render 'pages/home'
    end
  end

  def new
    @album = Album.new
    @title = "Create New Album"
  end

  def edit
    @title = "Edit Album"
  end

  def update
    if @album.update_attributes(params[:album])
      flash[:success] = "Album updated."
      redirect_to @album
    else
      @title = "Edit album"
      render 'edit'
    end
  end

  def show
    @album = Album.find(params[:id])
    @title = @album.name
  end

  def destroy
    @album.destroy
    redirect_back_or root_path
  end

  def index
    @title = "All albums"
#    @albums = Album.pginate(:page => params[:page])
  end

  private
  
    def authorized_user
      @album = Album.find(params[:id])
      redirect_to root_path unless current_user?(@album.user_id)
    end

    def get_album_cover
      @album = Album.find(params[:id])
#      @album_cover_url = Picture.find(@album.album_cover).image.url(:thumb)
    end

end
