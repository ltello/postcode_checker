class ServicesController < ApplicationController
  def index
  end

  def check
    @check    = CheckPostcodeServable.call(check_params)
    @message  = @check.message
    @postcode = @check.postcode
  end

  private

  def check_params
    params.permit(:postcode)
  end
end
