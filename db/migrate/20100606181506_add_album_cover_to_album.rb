class AddAlbumCoverToAlbum < ActiveRecord::Migration
  def self.up
    add_column :albums, :album_cover, :integer
  end

  def self.down
    remove_column :albums, :album_cover
  end
end
