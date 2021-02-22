require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  before(:each) do
    @mech1 = Mechanic.create!(name: "Jack Smith", years_experience: 10)
    @mech2 = Mechanic.create!(name: "Jill Smith", years_experience: 15)
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
end
