require 'spec_helper'

describe ArtworksController do

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
      @user = test_sign_in(Factory(:user))
      @attr = { }
      @artwork = Factory(:artwork, @attr.merge(:user => @user))

      @user.artworks.stub!(:build).and_return(@artwork)
    end

    describe "failure" do

      before(:each) do
        @artwork.should_receive(:save).and_return(false)
      end

      it "should render the home page" do
        post :create, :artwork => @attr
        response.should render_template('pages/home')
      end
    end

    describe "success" do

      before(:each) do
        @artwork.should_receive(:save).and_return(true)
      end

      it "should redirect to the home page" do
        post :create, :artwork => @attr
        response.should redirect_to(root_path)
      end

      it "should have a flash message" do
        post :create, :artwork => @attr
        flash[:success].should =~ /artwork created/i
      end
    end
  end

  describe "DELETE 'destroy'" do

    describe "for an unauthorized user" do

      before(:each) do
        @user = Factory(:user)
        wrong_user = Factory(:user, :email => Factory.next(:email))
        test_sign_in(wrong_user)
        @artwork = Factory(:artwork, :user => @user)
      end

      it "should deny access" do
        @artwork.should_not_receive(:destroy)
        delete :destroy, :id => @artwork
        response.should redirect_to(root_path)
      end
    end

    describe "for an authorized user" do

      before(:each) do
        @user = test_sign_in(Factory(:user))
        @artwork = Factory(:artwork, :user => @user)
        Artwork.should_receive(:find).with(@artwork).and_return(@artwork)
      end

      it "should destroy the user" do
        @artwork.should_receive(:destroy).and_return(@artwork)
        delete :destroy, :id => @artwork
      end
    end
  end

end
