describe "services/check" do
  before do
    assign(:postcode, "SE1 Q5A")
    assign(:message,  "Yes!")
    render
  end

  it "display a form to type a postcode" do
    expect(rendered).to match('form action="/services/check"')
    expect(rendered).to match('input value="SE1 Q5A"')
  end

  it "display a message with the result of the checking" do
    expect(rendered).to match('<div id="check_message">Yes!</div>')
  end
end
