class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.string  :postal_code
      t.string  :address
      t.integer  :billing_amount
      t.integer  :payment_method
      t.text    :name
      t.integer  :postage
      t.timestamps
    end
  end
end
