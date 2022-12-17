class Partner < ApplicationRecord
  has_many :requests, dependent: :destroy
  has_many :follows, dependent: :destroy
  
  def already_requested?(user)
    self.follow.exists_(app_id: user.id)
  end
end
