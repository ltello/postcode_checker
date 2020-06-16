class ServicesController < ApplicationController
  def index
  end

  def check
    @check = CheckPostcodeServable.call(check_params)
  end

  private

  def check_params
    params.permit(:postcode)
  end
end
