class Ride < ApplicationRecord
  belongs_to :park

  has_many :work_orders
  has_many :mechanics, through: :work_orders

  def self.average_thrill_rating
    average(:thrill_rating)
  end
end
