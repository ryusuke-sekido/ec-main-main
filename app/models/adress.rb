class Adress < ApplicationRecord
end
def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
end