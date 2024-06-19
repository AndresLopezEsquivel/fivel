class Service < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many_attached :images

  include PgSearch::Model
  pg_search_scope :search_by_service,
  against: [ :title, :description, :category ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
