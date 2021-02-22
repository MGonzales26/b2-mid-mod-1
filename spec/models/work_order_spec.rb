require 'rails_helper'

RSpec.describe WorkOrder, type: :model do
  describe "Relationships" do
    it { should belong_to :mechanic }
    it { should belong_to :ride }
  end
end
