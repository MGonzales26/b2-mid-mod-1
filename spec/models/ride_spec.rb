require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe "Relationships" do
    it { should have_many :work_orders }
    it { should have_many(:mechanics).through(:work_orders) }
    it { should belong_to :park }
  end

  describe "Class Methods" do
    describe "::average_thrill_rating" do
      it "returns the average thrill rating of the rides" do
        @flags = Park.create!(name: "Six Flags Over Texas", admission_price: 50.00)

        @sled = @flags.rides.create!(name: "Bob Sled", thrill_rating: 5, open: true)
        @titan = @flags.rides.create!(name: "Titan", thrill_rating: 10, open: true)
        @giant = @flags.rides.create!(name: "The Texas Giant", thrill_rating: 8, open: true)
        @scream = @flags.rides.create!(name: "Judge Roy Scream", thrill_rating: 6, open: true)
        @freeze = @flags.rides.create!(name: "Mr. Freeze", thrill_rating: 9, open: false)
        @wave = @flags.rides.create!(name: "The Shockwave", thrill_rating: 7, open: true)
    

        expect(Ride.average_thrill_rating).to eq(7.5)
      end
    end
  end
end
