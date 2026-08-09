class Product < ApplicationRecord
  belongs_to :category, optional: true
  has_many :line_items, dependent: :nullify

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :in_stock, -> { where("stock > 0") }
  scope :by_category, ->(category_id) { where(category_id: category_id) if category_id.present? }
end
