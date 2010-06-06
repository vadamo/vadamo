# == Schema Information
# Schema version: 20100605200743
#
# Table name: artworks
#
#  id                 :integer         not null, primary key
#  owner_id           :integer
#  filename           :string(255)
#  thumbail           :string(255)
#  size               :integer
#  height             :integer
#  width              :integer
#  content_type       :integer
#  created_at         :datetime
#  updated_at         :datetime
#  user_id            :integer
#  description        :text
#  type               :string(255)
#  subtype            :string(255)
#  print              :string(255)
#  style              :string(255)
#  subject            :string(255)
#  tags               :text
#  quantity           :integer
#  quantity_remaining :integer
#  edition_number     :integer
#  physical_width     :integer(2)
#  physical_height    :integer(2)
#  physical_depth     :integer(2)
#  physical_weight    :integer(2)
#  physical_framed    :integer(2)
#  price              :integer(2)
#  ships_from         :string(255)
#  ships_to           :string(255)
#  shipping_cost      :integer(2)
#

class Artwork < ActiveRecord::Base

  belongs_to :user
  has_many :pictures, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  validates_presence_of :user_id

  default_scope :order => 'created_at DESC'
end


