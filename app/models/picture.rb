# == Schema Information
# Schema version: 20100706223154
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

  attr_accessible :image

  belongs_to :artwork

  has_attached_file :image, 
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3, 
                    :s3_credentials => "#{RAILS_ROOT}/config/amazon_s3.yml",
                    :path => ":class/:id/:style.:extension"

  validates_attachment_presence :image
#  validates_presence_of :picture_id

#  default_scope :order => 'created_at DESC'

end
