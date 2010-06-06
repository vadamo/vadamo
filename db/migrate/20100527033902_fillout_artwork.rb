class FilloutArtwork < ActiveRecord::Migration
  def self.up
    add_column :artworks, :description, :text
    add_column :artworks, :type, :string
    add_column :artworks, :subtype, :string
    add_column :artworks, :print, :string
    add_column :artworks, :style, :string
    add_column :artworks, :subject, :string
    add_column :artworks, :tags, :text
    add_column :artworks, :quantity, :integer
    add_column :artworks, :quantity_remaining, :integer
    add_column :artworks, :edition_number, :integer
    add_column :artworks, :physical_width, :decimal, :precision => 2
    add_column :artworks, :physical_height, :decimal, :precision => 2
    add_column :artworks, :physical_depth, :decimal, :precision => 2
    add_column :artworks, :physical_weight, :decimal, :precision => 2
    add_column :artworks, :physical_framed, :decimal, :precision => 2
    add_column :artworks, :price, :decimal, :precision => 2
    add_column :artworks, :ships_from, :string
    add_column :artworks, :ships_to, :string
    add_column :artworks, :shipping_cost, :decimal, :precision => 2
    add_index :artworks, :user_id
#    add_column :artworks, :pictures
#    add_column :artworks, :has_many videos
#    add_column :artworks, :has_many favorites?
#    add_column :artworks, :has_many list memberships
#    add_column :artworks, :has owner
#    add_column :artworks, :has creator
#    add_column :artworks, :has seller
#    add_column :artworks, :has_connection
#    add_column :artworks, :has_many comments
#    add_column :artworks, :has_many trackbacks
#    add_column :artworks, :ratings

  end

  def self.down
    remove_column :artworks, :description
    remove_column :artworks, :type
    remove_column :artworks, :subtype
    remove_column :artworks, :print
    remove_column :artworks, :style
    remove_column :artworks, :subject
    remove_column :artworks, :tags
    remove_column :artworks, :quantity
    remove_column :artworks, :quantity_remaining
    remove_column :artworks, :edition_number
    remove_column :artworks, :physical_width
    remove_column :artworks, :physical_height
    remove_column :artworks, :physical_depth
    remove_column :artworks, :physical_weight
    remove_column :artworks, :physical_framed
    remove_column :artworks, :price
    remove_column :artworks, :ships_from
    remove_column :artworks, :ships_to
    remove_column :artworks, :shipping_cost
    remove_index  :artworks, :user_id
  end
end
