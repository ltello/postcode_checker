class CheckPostcodeServable
  include Interactor

  delegate :postcode, to: :context

  def call
    postcode_servable? || lsoa_servable? || no_servable!
  end

  private

  def postcode_servable?
    servable if ServableLocation.postcoded(postcode).exist?
  end
end
