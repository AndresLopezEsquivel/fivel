class Service < ApplicationRecord
  belongs_to :user
  has_many :sales
  has_many_attached :images
end
