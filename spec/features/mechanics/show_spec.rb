require 'rails_helper'

RSpec.describe "Mechanic Show Page" do
  before(:each) do
    @flags = Park.create!(name: "Six Flags Over Texas", admission_price: 50.00)

    @mech1 = Mechanic.create!(name: "Jack Smith", years_experience: 10)

    @sled = @flags.rides.create!(name: "Bob Sled", thrill_rating: 5, open: true)
    @titan = @flags.rides.create!(name: "Titan", thrill_rating: 10, open: true)
    @giant = @flags.rides.create!(name: "The Texas Giant", thrill_rating: 8, open: true)
    @scream = @flags.rides.create!(name: "Judge Roy Scream", thrill_rating: 6, open: true)
    @freeze = @flags.rides.create!(name: "Mr. Freeze", thrill_rating: 9, open: false)
    @wave = @flags.rides.create!(name: "The Shockwave", thrill_rating: 7, open: true)

    @mech1.rides << [@sled, @titan, @giant, @scream, @freeze]
  end

  describe "as a visitor" do
    it "shows their name, years of experience, and the names of all rides they’re working on" do
      visit mechanic_path(@mech1)

      expect(page).to have_content(@mech1.name)
      expect(page).to have_content(@mech1.years_experience)
      
      within("#rides-list") do
        expect(page).to have_content(@titan.name)
        expect(page).to have_content(@giant.name)
        expect(page).to have_content(@sled.name)
      end
    end
    
    it "only shows rides that are open" do
      visit mechanic_path(@mech1)

      within("#rides-list") do
        expect(page).to have_content(@titan.name)
        expect(page).to have_content(@giant.name)
        expect(page).to have_content(@sled.name)
        expect(page).to_not have_content(@freeze.name)
      end
    end
    
    it "lists rides by thrill rating in descending order (most thrills first)" do
      visit mechanic_path(@mech1)
      
      within("#rides-list") do
        expect(@titan.name).to appear_before(@giant.name)
        expect(@giant.name).to appear_before(@scream.name)
        expect(@scream.name).to appear_before(@sled.name)
      end
    end
    
    describe "add a ride to workload" do
      it "has a form to add a ride to their workload" do
        visit mechanic_path(@mech1)
        
        expect(page).to have_field(:add_ride)
      end
      
      it "returns to the show page with the new ride when entered into the field and submit is hit" do
        visit mechanic_path(@mech1)

        fill_in :add_ride, with: "#{@wave.id}"
        click_on "Submit"
        expect(current_path).to eq(mechanic_path(@mech1))

        expect(page).to have_content(@wave.name)
      end
    end
  end
end
