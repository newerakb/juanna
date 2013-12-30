require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Juanna.net'" do
      visit '/static_pages/home'
      expect(page).to have_content('Juanna.net')
    end
    
    it "should have the right title" do
      visit '/static_pages/home'
      expect(page).to have_title("Juanna.net | Home")
    end
  end
  
  describe "About page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      expect(page).to have_content('About')
    end
    
    it "should have the right title" do
      visit '/static_pages/about'
      expect(page).to have_title("Juanna.net | About")
    end
  end
  
  describe "Contact page" do
    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end
    
    it "should have the right title" do
      visit '/static_pages/contact'
      expect(page).to have_title("Juanna.net | Contact")
    end
  end
end
