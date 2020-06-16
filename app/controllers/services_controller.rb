# frozen_string_literal: true

class ServicesController < ApplicationController
  def check
    return if check_params.blank?
    @check    = CheckPostcodeServable.call(check_params)
    @message  = @check.message
    @postcode = @check.postcode
  end

  private

  def check_params
    @check_params ||= params.permit(:postcode)
  end
end
