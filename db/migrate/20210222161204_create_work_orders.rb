class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.references :mechanic, foreign_key: true
      t.references :ride, foreign_key: true

      t.timestamps
    end
  end
end
