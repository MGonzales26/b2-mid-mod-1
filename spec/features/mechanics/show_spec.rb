require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  before(:each) do
    @mech1 = Mechanic.create!(name: "Jack Smith", years_experience: 10)

    @titan = Ride.create!(name: "Titan", thrill_rating: 10, open: true)
    @giant = Ride.create!(name: "The Texas Giant", thrill_rating: 8, open: true)
    @scream = Ride.create!(name: "Judge Roy Scream", thrill_rating: 6, open: true)
    @freeze = Ride.create!(name: "Mr. Freeze", thrill_rating: 9, open: false)

    @mech1.rides << [@titan, @giant, @scream, @freeze]
  end

  describe "as a visitor" do
    it "shows their name, years of experience, and the names of all rides they’re working on" do
      visit mechanic_path(@mech1)
      
      expect(page).to have_content(@mech1.name)
      expect(page).to have_content(@mech1.years_experience)
      
      within("#rides-list") do
        expect(page).to have_content(@titan.name)
        expect(page).to have_content(@giant.name)
      end
    end
    
    it "only shows rides that are open" do
      visit mechanic_path(@mech1)
      
      within("#rides-list") do
        expect(page).to have_content(@titan.name)
        expect(page).to have_content(@giant.name)
        expect(page).to_not have_content(@freeze.name)
      end
    end
    
    it "lists rides by thrill rating in descending order (most thrills first)" do
      visit mechanic_path(@mech1)
      
      within("#rides-list") do
        expect(@titan.name).to appear_before(@giant.name)
        expect(@giant.name).to appear_before(@scream.name)
      end
    end
  end
end
