require 'rails_helper'

RSpec.describe "Mechanic Index Page" do
  describe "As a user" do
    it "has a header that says 'All Mechanics'" do
      visit mechanics_path

      expect(page).to have_content("All Mechanics")
    end
    it "shows a list of all mechanic’s names and their years of experience"
    it "shows the average years of experience across all mechanics"
    
  end

end