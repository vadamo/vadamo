class RenamePicturesPicturesold < ActiveRecord::Migration
  def self.up
    rename_table :pictures, :picturesold
  end 

  def self.down
    rename_table :picturesold, :pictures
  end
end

