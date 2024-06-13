class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :service

  def assign_buyer(user)
    self.user = user
  end
end
