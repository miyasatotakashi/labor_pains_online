class Partner < ApplicationRecord
  has_many :requests, dependent: :destroy
  validates :email, presence: true
  # h_many :follows, dependent: :destroy
  # belongs_to :user
  def already_requested?(user)
    self.follow.exists_(app_id: user.id)
  end
end
