require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @flags = Park.create!(name: "Six Flags Over Texas", admission_price: 50.00)

    @mech1 = Mechanic.create!(name: "Jack Smith", years_experience: 10)
    @mech2 = Mechanic.create!(name: "Jill Smith", years_experience: 15)

    @sled = @flags.rides.create!(name: "Bob Sled", thrill_rating: 5, open: true)
    @titan = @flags.rides.create!(name: "Titan", thrill_rating: 10, open: true)
    @giant = @flags.rides.create!(name: "The Texas Giant", thrill_rating: 8, open: true)
    @scream = @flags.rides.create!(name: "Judge Roy Scream", thrill_rating: 6, open: true)
    @freeze = @flags.rides.create!(name: "Mr. Freeze", thrill_rating: 9, open: false)

    @mech1.rides << [@sled, @titan, @giant, @scream, @freeze]
  end

  describe "Relationships" do
    it { should have_many :work_orders }
    it { should have_many(:rides).through(:work_orders) }
  end

  describe "Class Methods" do
    describe "::average_years_experience" do
      it "calculates the years of experience of all the mechanics" do

        expect(Mechanic.average_years_experience).to eq(12.5)
      end
    end
  end

  describe "Instance Methods" do
    describe "#ride_list_by_thrill" do
      it "lists the rides from most thrilling to least thrilling" do

        expected = [@titan, @freeze, @giant, @scream, @sled]

        expect(@mech1.ride_list_by_thrill).to eq(expected)
      end
    end
  end
end
