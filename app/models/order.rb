class Order < ApplicationRecord
  has_many :line_items, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
    format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
  validates :status, presence: true, inclusion: { in: %w[pending confirmed] }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }

  before_validation :set_defaults

  private

  def set_defaults
    self.status ||= "confirmed"
    self.total ||= 0
  end
end
