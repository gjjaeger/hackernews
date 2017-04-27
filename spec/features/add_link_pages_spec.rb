require 'rails_helper'

  describe "the add a link process" do
    it "adds a new link" do
      visit links_path
      click_link 'New Link'
      fill_in 'Url', :with => 'Home stuff'
      fill_in 'Title', :with => 'test'
      click_on 'Create Link'
      expect(page).to have_content 'Links'
    end

    it "gives error when no url is entered" do
      visit new_link_path
      click_on 'Create Link'
      expect(page).to have_content 'errors'
    end
  end
