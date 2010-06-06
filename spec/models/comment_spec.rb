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

require 'spec_helper'

describe Comment do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :body => "value for body",
      :artwork_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Comment.create!(@valid_attributes)
  end
end
