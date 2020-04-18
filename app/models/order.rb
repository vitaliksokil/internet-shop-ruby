class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES


  def add_order_id_to_line_items(cart,order_id)
    cart.line_items.each do |item|
      item.order_id = order_id
      item.save

    end
  end

end
