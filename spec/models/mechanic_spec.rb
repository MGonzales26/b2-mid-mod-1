require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe "Relationships" do
    it { should have_many :work_orders }
    it { should have_many(:rides).through(:work_orders) }
  end
end
