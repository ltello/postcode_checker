class CheckPostcodeServable
  include Interactor

  delegate :postcode, to: :context

  def call
    postcode_servable? || lsoa_servable? || no_servable!
  end

  private

  def lsoa_servable?
    if location = Postcodes::IO.new.lookup(postcode)
      servable if ServableArea.with_lsoa(location.lsoa).exists?
    end
  end

  def postcode_servable?
    servable if ServableLocation.with_postcode(postcode).exists?
  end

  def servable
    context.message = "Success!. We serve postcode #{postcode}"
    true
  end
end
