require 'rails_helper'

RSpec.describe "Mechanic Index Page" do
  before(:each) do
    @mech1 = Mechanic.create!(name: "Jack Smith", years_experience: 10)
    @mech2 = Mechanic.create!(name: "Jill Smith", years_experience: 15)
  end

  describe "As a user" do
    it "has a header that says 'All Mechanics'" do
      visit mechanics_path
      
      expect(page).to have_content("All Mechanics")
    end
    
    it "shows a list of all mechanic’s names and their years of experience" do
      visit mechanics_path
      
      expect(page).to have_content(@mech1.name)
      expect(page).to have_content(@mech1.years_experience)
      expect(page).to have_content(@mech2.name)
      expect(page).to have_content(@mech2.years_experience)
    end

    it "shows the average years of experience across all mechanics" do
      visit mechanics_path

      expect(page).to have_content(12.5)
      expect(page).to have_content("years of experience")
    end
  end
end