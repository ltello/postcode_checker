feature "User checks postcode" do
  scenario "Servable postcode" do
    postcode = "W4 2HN"
    create(:servable_location, postcode: postcode)

    check_postcode(postcode)

    expect(page).to have_selector("#check_message", text: "Great, We serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end

  scenario "Postcode in servable area" do
    postcode = "SE1 7QD"
    create(:servable_area, lsoa: "Southwark 034A")

    check_postcode(postcode)

    expect(page).to have_selector("#check_message", text: "Great, We serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end

  scenario "Location not servable" do
    postcode = "W69TT"
    create(:servable_location, postcode: "W4 2HN")
    create(:servable_area, lsoa: "Southwark 034A")

    check_postcode(postcode)

    expect(page).to have_selector("#check_message", text: "Sorry, We don't serve postcode #{postcode}")
    expect(page).to have_field("postcode", type: "text", with: postcode)
  end
end
