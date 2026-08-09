class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.decimal :total
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
