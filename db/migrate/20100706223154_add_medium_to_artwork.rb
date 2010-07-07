class AddMediumToArtwork < ActiveRecord::Migration
  def self.up
    add_column :artworks, :medium, :string
  end

  def self.down
    remove_column :artworks, :medium
  end
end
