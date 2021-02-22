require 'rails_helper'

RSpec.describe Park, type: :model do
  describe "Relationships" do
    it { should have_many :rides }
  end
end
