describe UKPostcodeValidator, type: :model do
  with_model :MyProperty do
    model do
      attr_accessor :postcode
      validates :postcode, UK_postcode: true
    end
  end

  VALID_VALUES = [
    "SE1 7QA",
    "SE1 7QD",
    "SE17QD"
  ]

  INVALID_VALUES = [
    "SE1 7Q5",
    "SSSSSSS",
    "SE17 QD"
  ]

  subject { MyProperty.new }

  it 'allows valid values' do
    expect(subject).to allow_values(*VALID_VALUES).for(:postcode)
  end

  it 'do not allow not recognized uk postcodes' do
    expect(subject).not_to allow_values(*INVALID_VALUES).for(:postcode).with_message("not a recognized UK postcode")
  end
end
