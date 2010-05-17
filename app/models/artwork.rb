# == Schema Information
# Schema version: 20100516044150
#
# Table name: artworks
#
#  id           :integer         not null, primary key
#  owner_id     :integer
#  filename     :string(255)
#  thumbail     :string(255)
#  size         :integer
#  height       :integer
#  width        :integer
#  content_type :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

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


