require 'rails_helper'

RSpec.describe "Park Show Page" do
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

  describe "As a visitor" do
    it "shows the name and price of admissions for that amusement park" do
      visit park_path(@flags)
      
      expect(page).to have_content(@flags.name)
      expect(page).to have_content(@flags.admission_price)
    end
    
    it "shows the names of all the rides that are at that theme park listed in alphabetical order" do
      visit park_path(@flags)
      
      expect(@sled.name).to appear_before(@scream.name)
      expect(@scream.name).to appear_before(@freeze.name)
      expect(@freeze.name).to appear_before(@wave.name)
      expect(@wave.name).to appear_before(@giant.name)
      expect(@giant.name).to appear_before(@titan.name)
    end
    
    it "shows average thrill rating of this amusement park’s rides" do
      visit park_path(@flags)

      expect(page).to have_content("Average thrill rating of this parks rides")
      expect(page).to have_content(@flags.rides.average_thrill_rating)
    end
  end
end