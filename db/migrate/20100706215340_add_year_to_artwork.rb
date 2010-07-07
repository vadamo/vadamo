class AddYearToArtwork < ActiveRecord::Migration
  def self.up
    add_column :artworks, :year, :integer
  end

  def self.down
    remove_column :artworks, :year
  end
end
