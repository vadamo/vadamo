class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :user_id
      t.integer :artwork_id
      t.string  :name
      t.string  :description
      t.string  :filename
      t.string  :thumbail
      t.integer :size
      t.integer :height
      t.integer :width
      t.integer :content_type

      t.timestamps
    end
    add_index :pictures, :artwork_id
    add_index :pictures, :user_id
  end

  def self.down
    drop_table :pictures
  end
end
