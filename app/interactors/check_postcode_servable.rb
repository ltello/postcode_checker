# frozen_string_literal: true

class CheckPostcodeServable
  include Interactor

  delegate :postcode, to: :context

  def call
    postcode_servable? || lsoa_servable? || no_servable!
  end

  private

  def lsoa_servable?
    location = Postcodes::IO.new.lookup(postcode)
    servable if location && ServableArea.with_lsoa(location.lsoa).exists?
  end

  def no_servable!
    context.fail!(message: "Sorry, We don't serve postcode #{postcode}")
  end

  def postcode_servable?
    servable if ServableLocation.with_postcode(postcode).exists?
  end

  def servable
    context.message = "Great, We serve postcode #{postcode}"
    true
  end
end
