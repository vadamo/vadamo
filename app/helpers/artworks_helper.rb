module ArtworksHelper
  
  def current_artwork
    @artwork
  end
  
  def current_artwork=(artwork)
    @artwork = artwork
  end
  
  def add_picture_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :pictures, :partial => 'picture', :object => Picture.new
    end
  end

end
