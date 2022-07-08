class CartItem < ApplicationRecord
  belongs_to :customer
end

#def subtotal
 #   item.with_tax_price * amount
#end