feature "User checks postcode" do
  scenario "Servable postcode" do
    postcode = "SE1 7QD"

    visit root_path
    fill_in("postcode", with: postcode)
    click_on("Check")

    expect(page).to have_selector("check_result", with: "Success!. We serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end
end
