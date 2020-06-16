# frozen_string_literal: true

module FeatureHelpers
  def check_postcode(postcode)
    visit root_path
    fill_in("postcode", with: postcode)
    click_on("Check")
  end
end
