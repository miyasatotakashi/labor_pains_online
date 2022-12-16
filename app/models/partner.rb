class Partner < ApplicationRecord
  scope :certification_code_search, -> (code) {where("certification_code LIKE ?", "%#{code}%")}
end
