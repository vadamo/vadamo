# == Schema Information
# Schema version: 20100606181506
#
# Table name: pictures
#
#  id                 :integer         not null, primary key
#  user_id            :integer
#  artwork_id         :integer
#  name               :string(255)
#  description        :string(255)
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#  created_at         :datetime
#  updated_at         :datetime
#


class Picture < ActiveRecord::Base

  belongs_to :artwork

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

#  has_attachment :storage => :s3, 
#                 :content_type => :image,
#                 :max_size => 2.megabytes,
#                 :resize_to => '640x400>',
#  :thumbnails => { :thumb => '100x100>' }

#  validates_as_attachment
#  validates_presence_of :picture_id

  default_scope :order => 'created_at DESC'

end
