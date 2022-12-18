class Partner < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :follows, dependent: :destroy

  def already_requested?(user)
    self.requests.exists?(user_id: user.id)
  end
end
