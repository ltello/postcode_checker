class CheckPostcodeServable
  include Interactor

  delegate :postcode, to: :context

  def call
    postcode_servable? || lsoa_servable? || no_servable!
  end

  private

  def postcode_servable?
    servable if ServableLocation.with_postcode(postcode).exist?
  end
end
