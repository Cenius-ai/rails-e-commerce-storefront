class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: true

  validates :quantity, presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validates :price, presence: true,
    numericality: { greater_than_or_equal_to: 0 }

  def subtotal
    price * quantity
  end
end
