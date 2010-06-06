class CreateV2PicturesWithPaperclip < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer  :user_id
      t.integer  :artwork_id
      t.string   :name
      t.string   :description
      t.string   :image_file_name
      t.string   :image_content_type
      t.integer  :image_file_size
      t.datetime :image_updated_at

      t.timestamps
    end
    add_index :pictures, :artwork_id
    add_index :pictures, :user_id
  end

  def self.down
    drop_table :pictures
  end
end
