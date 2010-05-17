class Artwork < ActiveRecord::Base

  belongs_to :user

  has_attachment :storage => :s3, 
  #                 :content_type => :image,
                 :max_size => 2.megabytes,
#                 :resize_to => '640x400>',
  :thumbnails => { :thumb => '100x100>' }

  validates_as_attachment
  validates_presence_of :user_id

  default_scope :order => 'created_at DESC'
end


