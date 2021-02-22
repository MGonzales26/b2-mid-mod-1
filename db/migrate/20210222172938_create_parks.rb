class CreateParks < ActiveRecord::Migration[5.2]
  def change
    create_table :parks do |t|
      t.string :name
      t.float :admission_price

      t.timestamps
    end
  end
end
