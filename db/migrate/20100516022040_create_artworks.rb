class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.integer :owner_id
      t.string :filename
      t.string :thumbail
      t.integer :size
      t.integer :height
      t.integer :width
      t.integer :content_type

      t.timestamps
    end

  end

  def self.down
    drop_table :artworks
  end
end
