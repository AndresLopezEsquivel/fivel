class Service < ApplicationRecord
  belongs_to :user
  has_many :sales, dependent: :destroy
  has_many_attached :images

  include PgSearch::Model
  pg_search_scope :search_by_service,
  against: [ :title, :description, :category ],
  using: {
    tsearch: { prefix: true }
  }
end
