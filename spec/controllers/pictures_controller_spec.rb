require 'spec_helper'

describe PicturesController do

  integrate_views

  describe "access control" do

    it "should deny access to 'create'" do
      post :create
      response.should redirect_to(signin_path)
    end

    it "should deny access to 'destroy'" do
      delete :destroy
      response.should redirect_to(signin_path)
    end
  end

  describe "POST 'create'" do

    before(:each) do
      @user = test_sign_in(Factory(:user, :email => Factory.next(:email)))
      @attr = { }
      @artwork = Factory(:artwork, @attr.merge(:user => @user))
      @attxr = { :image_file_size => 1.kilobyte, :image_content_type => 'foo', :image_file_name => "rattle77", :user_id => @user.id, :artwork_id => @artwork.id } 
      @picture = Factory(:picture, @attxr)
      @artwork.pictures.stub!(:build).and_return(@picture)
    end

    describe "failure" do

      before(:each) do
        @picture.should_receive(:save).and_return(false)
      end

      it "should render the home page" do
        post :create, :picture => @attxr
        response.should render_template('pages/home')
      end
    end

    describe "success" do
      
      before(:each) do
        @picture.should_receive(:save).and_return(true)
      end

      it "should redirect to the home page" do
        post :create, :picture => @attxr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :picture => @attxr
        flash[:success].should =~ /picture created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user, :email => Factory.next(:email))
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @attr = { }
        @artwork = Factory(:artwork, @attr.merge(:user => @user))
        @attr2 = { :image_file_size => 1.kilobyte, :image_content_type => 'foo', :image_file_name => "rattle77", :user_id => @user.id } 
        @picture = Factory(:picture, @attr2.merge(:artwork =>  @artwork))
      end

      it "should deny access" do
        @picture.should_not_receive(:destroy)
        delete :destroy, :id => @picture
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        user = Factory(:user, :email => Factory.next(:email))
        @user = test_sign_in(user)
        @attr = { }
        @artwork = Factory(:artwork, @attr.merge(:user => @user))
        @attr2 = { :image_file_size => 1.kilobyte, :image_content_type => 'foo', :image_file_name => "rattle77", :user_id => @user.id } 
        @picture = Factory(:picture, @attr2.merge(:artwork =>  @artwork))

        Picture.should_receive(:find).with(@picture).and_return(@picture)
      end

      it "should destroy the picture" do
        @picture.should_receive(:destroy).and_return(@picture)
        delete :destroy, :id => @picture
      end
    end
  end

end
