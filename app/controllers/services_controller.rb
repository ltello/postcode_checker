class ServicesController < ApplicationController
  def index
  end

  def check
    @check = CheckPostcodeServable.call(check_params[:postcode])
  end

  private

  def check_params
    params.permit(:postcode)
  end
end
