feature "User checks postcode" do
  scenario "Servable postcode" do
    postcode = "W4 2HN"
    create(:servable_location, postcode: postcode)

    visit root_path
    fill_in("postcode", with: postcode)
    click_on("Check")

    expect(page).to have_selector("#check_message", text: "Success!. We serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end

  scenario "Postcode in servable area" do
    postcode = "SE1 7QD"
    create(:servable_area, lsoa: "Southwark 034A")

    visit root_path
    fill_in("postcode", with: postcode)
    click_on("Check")

    expect(page).to have_selector("#check_message", text: "Success!. We serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end
end
