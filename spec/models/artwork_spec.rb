require 'spec_helper'

describe Artwork do

  before(:each) do
    @user = Factory(:user)

    # Need Size, Content type, filename
    @attr = {
#      :content => "value for content",
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

    it "should require a user id" do
      Artwork.new(@attr).should_not be_valid
    end

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
