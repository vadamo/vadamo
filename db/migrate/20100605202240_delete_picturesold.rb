class DeletePicturesold < ActiveRecord::Migration
  def self.up
    drop_table :picturesold
  end

  def self.down
    create_table :picturesold do |t|
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
    add_index :picturesold, :artwork_id
    add_index :picturesold, :user_id
    
  end
end
