class AddNameToArtwork < ActiveRecord::Migration
  def self.up
    add_column :artworks, :name, :string
  end

  def self.down
    remove_column :artworks, :name
  end
end
