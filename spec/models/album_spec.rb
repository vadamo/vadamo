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

require 'spec_helper'

describe Album do
  before(:each) do
    @valid_attributes = {
      
    }
  end

  it "should create a new instance given valid attributes" do
    Album.create!(@valid_attributes)
  end
end
