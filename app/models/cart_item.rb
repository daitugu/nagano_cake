class CartItem < ApplicationRecord
belongs_to :customer
belongs_to :item
has_many :orders
def subtotal
    item.with_tax_price * amount
end
end
