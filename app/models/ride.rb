class Ride < ApplicationRecord
  has_many :work_orders
  has_many :mechanics, through: :work_orders
end
