class Mechanic < ApplicationRecord
  has_many :work_orders
  has_many :rides, through: :work_orders
end
