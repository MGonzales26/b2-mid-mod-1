require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe "Relationships" do
    it { should have_many :work_orders }
    it { should have_many(:mechanics).through(:work_orders) }
  end
end
