# frozen_string_literal: true

class ServableLocation < ApplicationRecord
  # Scopes
  scope :with_postcode, ->(postcode) { where(postcode: UKPostcode.parse(postcode).to_s) }

  # Validations
  validates :postcode, presence: true, uniqueness: { case_sensitive: false }, UK_postcode: true

  # Instance methods
  # Assign UK normalised postcode value.
  def postcode=(value)
    super(UKPostcode.parse(value.to_s).to_s)
  end
end
