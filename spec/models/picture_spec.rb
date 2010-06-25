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

require 'spec_helper'

describe Picture do

  before(:each) do
    @artwork = Factory(:artwork)

    # Need Size, Content type, filename
    @attr = {
      :artwork_id => @artwork.id, 
      :created_at => 1.day.ago, 
      :image_content_type => 'foo', 
      :image_file_size => 1.kilobyte, 
      :image_file_name => "test.jpg"
    }
  end

  it "should create a new instance given valid attributes" do
    Picture.create!(@attr)
  end

  describe "artwork associations" do
    
    before(:each) do
      @picture = @artwork.pictures.create(@attr)
    end

    it "should have an artwork attribute" do
      @picture.should respond_to(:artwork)
    end

    it "should have the right associated artwork" do
      @picture.artwork_id.should == @artwork.id
      @picture.artwork.should == @artwork
    end

  end

  describe "validations" do

    #it "should require a artwork id" do
    #  Picture.new(@attr).should_not be_valid
    #end

    #fix
    #it "should require nonblank content" do
    #  @artwork.pictures.build(:content => "  ").should_not be_valid
    #end

    #fix
    #it "should reject long content" do
    #  @artwork.pictures.build(:content => "a" * 141).should_not be_valid
    #end
  end

end
