# == Schema Information
# Schema version: 20100606023813
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  body       :string(255)
#  artwork_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Comment < ActiveRecord::Base
  belongs_to :artwork
end
