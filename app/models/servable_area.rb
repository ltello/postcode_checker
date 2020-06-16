class ServableArea < ApplicationRecord

  # Scopes
  scope :with_lsoa, ->(lsoa) { where(lsoa: lsoa) }

  # Validations
  validates :lsoa, presence: true, uniqueness: { case_sensitive: false }
end
