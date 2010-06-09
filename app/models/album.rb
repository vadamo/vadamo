# == Schema Information
# Schema version: 20100606181506
#
# Table name: albums
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  album_cover :integer
#

class Album < ActiveRecord::Base
  belongs_to :user
  has_many   :artworks,   :dependent => :destroy

  #fixme: add sharability, metrics, date

  validates_presence_of :user_id

  default_scope :order => 'created_at DESC'
end
