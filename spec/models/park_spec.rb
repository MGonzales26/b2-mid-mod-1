require 'rails_helper'

RSpec.describe Park, type: :model do
  describe "Relationships" do
    it { should have_many :rides }
  end

  describe "Instance Methods" do
    describe "#rides_aplphabetical_order" do
      it "lists all the rides for a park in alphabetical order" do
        @flags = Park.create!(name: "Six Flags Over Texas", admission_price: 50.00)

        @sled = @flags.rides.create!(name: "Bob Sled", thrill_rating: 5, open: true)
        @titan = @flags.rides.create!(name: "Titan", thrill_rating: 10, open: true)
        @giant = @flags.rides.create!(name: "The Texas Giant", thrill_rating: 8, open: true)
        @scream = @flags.rides.create!(name: "Judge Roy Scream", thrill_rating: 6, open: true)
        @freeze = @flags.rides.create!(name: "Mr. Freeze", thrill_rating: 9, open: false)
        @wave = @flags.rides.create!(name: "The Shockwave", thrill_rating: 7, open: true)
    
        expected = [@sled, @scream, @freeze, @wave, @giant, @titan]

        expect(@flags.rides_aplphabetical_order).to eq(expected)
      end
    end
  end
end
