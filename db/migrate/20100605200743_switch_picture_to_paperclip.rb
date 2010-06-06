class SwitchPictureToPaperclip < ActiveRecord::Migration
  def self.up
    remove_column :pictures, :filename
    remove_column :pictures, :thumbnail
    remove_column :pictures, :size
    remove_column :pictures, :height
    remove_column :pictures, :width
    remove_column :pictures, :content_type
    add_column :pictures, :image_file_name,    :string
    add_column :pictures, :image_content_type, :string
    add_column :pictures, :image_file_size,    :integer
    add_column :pictures, :image_updated_at,   :datetime
  end

  def self.down
    remove_column :pictures, :image_file_name
    remove_column :pictures, :image_content_type
    remove_column :pictures, :image_file_size
    remove_column :pictures, :image_updated_at
    add_column :pictures, :filename,     :string
    add_column :pictures, :thumbnail,    :string
    add_column :pictures, :size,         :integer
    add_column :pictures, :height,       :integer
    add_column :pictures, :width,        :integer
    add_column :pictures, :content_type, :integer
  end
end
