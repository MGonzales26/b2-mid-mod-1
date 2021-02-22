class Park < ApplicationRecord
  has_many :rides

  def rides_aplphabetical_order
    rides.order(:name)
  end
end
