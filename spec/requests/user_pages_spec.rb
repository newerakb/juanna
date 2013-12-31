require 'spec_helper'

describe "User pages" do
  subject { page }

  describe "register page" do
    before { visit register_path }

    it { should have_content('Create a new account') }
    it { should have_title(full_title('Register')) }
  end
end
