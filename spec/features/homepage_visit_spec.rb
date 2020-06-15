feature "User visits homepage" do
  scenario "A form to check postcode service is displayed" do
    visit root_path

    expect(page).to have_selector "h1", text: "Servable Postcode Checker"
    expect(page).to have_field("postcode", type: "text", placeholder: "Type a postcode to check if it is servable")
  end
end
