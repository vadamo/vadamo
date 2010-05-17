require 'spec_helper'

describe "Artworks" do

  before(:each) do
    @user = Factory(:user)
    visit signin_path
    fill_in :email,    :with => @user.email
    fill_in :password, :with => @user.password
    click_button
  end
  
  describe "creation" do
    
    describe "failure" do
    
      it "should not make a new artwork" do
        lambda do
          visit root_path
          click_button
          response.should render_template('pages/home')
          response.should have_tag("div#errorExplanation")
        end.should_not change(Artwork, :count)
      end
    end

    describe "success" do
  
      it "should make a new user" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit root_path
          fill_in :artwork_content, :with => content
          click_button
          response.should have_tag("div.flash.success")
          response.should have_tag("span.content", content)
        end.should change(Artwork, :count).by(1)
      end
    end
  end
  
  describe "destruction" do

    it "should destroy a artwork" do
      # Create a artwork.
      visit root_path
      fill_in :artwork_content, :with => "lorem ipsum"
      click_button
      # Destroy it.
      lambda { click_link "delete" }.should change(Artwork, :count).by(-1)
    end
  end
end

