class ServicesController < ApplicationController
  def check
    if check_params.present?
      @check    = CheckPostcodeServable.call(check_params)
      @message  = @check.message
      @postcode = @check.postcode
    end
  end

  private

  def check_params
    @check_params ||= params.permit(:postcode)
  end
end
