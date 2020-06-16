# frozen_string_literal: true

class UKPostcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, "not a recognized UK postcode") unless uk_postcode?(value)
  end

  private

  def uk_postcode?(value)
    UKPostcode.parse(value).full_valid?
  end
end
