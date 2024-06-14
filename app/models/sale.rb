class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :status, :date, :price, :user_id, :service_id, presence: true
  validates :price, numericality: { only_integer: true }
end
