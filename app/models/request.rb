class Request < ApplicationRecord
  validates :certification_code, presence: true
  # belongs_to :users 
  # belongs_to :partner, optional: true 
end
