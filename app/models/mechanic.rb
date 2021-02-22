class Mechanic < ApplicationRecord
  has_many :work_orders
  has_many :rides, through: :work_orders

  def self.average_years_experience
    average(:years_experience)
  end
end
