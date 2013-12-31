require 'spec_helper'

describe "Static pages" do
  subject { page }
  
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Juanna.net') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
  end
  
  describe "About page" do
    before { visit about_path }
    
    it { should have_content('About') }
    it { should have_title(full_title('About')) }
  end
  
  describe "Contact page" do
    before { visit contact_path }
    
    it { should have_selector('h1', text: 'Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
    click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
    click_link "Home"
    click_link "Register now!"
    expect(page).to have_title(full_title('Register'))
    click_link "Juanna.net"
    expect(page).to have_title(full_title(''))
  end
end
