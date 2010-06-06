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

require 'spec_helper'

describe Artwork do

  before(:each) do
    @user = Factory(:user)

    # Need Size, Content type, filename
    @attr = {
      :user => @user, 
      :created_at => 1.day.ago, 
      :content_type => 'foo', 
      :size => 1.kilobyte, 
      :filename => "test.jpg"
    }
  end

  it "should create a new instance given valid attributes" do
    @user.artworks.create!(@attr)
  end

  describe "user associations" do
    
    before(:each) do
      @artwork = @user.artworks.create(@attr)
    end

    it "should have a user attribute" do
      @artwork.should respond_to(:user)
    end

    it "should have the right associated user" do
      @artwork.user_id.should == @user.id
      @artwork.user.should == @user
    end

  end

  describe "validations" do

    #fix
    #it "should require a user id" do
    #  Artwork.new(@attr).should_not be_valid
    #end

    #fix
    #it "should require nonblank content" do
    #  @user.artworks.build(:content => "  ").should_not be_valid
    #end

    #fix
    #it "should reject long content" do
    #  @user.artworks.build(:content => "a" * 141).should_not be_valid
    #end
  end

end
