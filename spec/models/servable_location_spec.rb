describe ServableLocation do
  context "database columns" do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(primary: true) }
    it { is_expected.to have_db_column(:postcode).of_type(:string) .with_options(null: false) }
  end

  context "database indexes" do
    it { is_expected.to have_db_index(:postcode) }
  end

  context "validations" do
    subject { build(:servable_location) }

    it { is_expected.to validate_presence_of(:postcode) }
    it { is_expected.to validate_uniqueness_of(:postcode).case_insensitive }

    context "UK postcode" do
      let(:location) { build(:servable_location, postcode: postcode) }

      before do
        location.valid?
      end

      context "when the postcode value is not a recognized UK postcode" do
        let(:postcode) { "SE1 7Q5" }

        it "add validation error to :postcode field" do
          expect(location.errors[:postcode]).to include("not a recognized UK postcode")
        end
      end

      context "when the postcode value is a recognized UK postcode" do
        let(:postcode) { "SE1 7QA" }

        it "no validation error is added to :postcode field" do
          expect(location.errors[:postcode]).to be_blank
        end
      end
    end
  end

  context "class methods" do
    describe ".with_postcode(postcode)" do
      let!(:servable_location) { create(:servable_location, postcode: "SE1 7QD") }
      let(:result)             { described_class.with_postcode(postcode) }

      context "when no location with the given postcode exists" do
        let(:postcode) { "SE1 7QE" }

        it "return no locations" do
          expect(result).to be_empty
        end
      end

      context "when a location with the given postcode exists" do
        context "when the given postcode value is not normalized" do
          let(:postcode) { "SE17QD" }

          it "include the location in the response" do
            expect(result.to_a).to include(servable_location)
          end
        end

        context "when the given postcode value is normalized" do
          let(:postcode) { "SE1 7QD" }

          it "include the location in the response" do
            expect(result.to_a).to include(servable_location)
          end
        end
      end
    end
  end

  context "instance methods" do

    context "#postcode=(value)" do
      let(:location) { build(:servable_location) }

      before do
        location.postcode = postcode
      end

      context "when the value to assign is not a recognized UK postcode" do
        let(:postcode) { "SE17Q5" }

        it "the assigned value is not modified" do
          expect(location.postcode).to eq(postcode)
        end
      end

      context "when the value to assign is a recognized UK postcode" do
        let(:postcode) { "SE17QA" }

        it "the assigned value is normalized" do
          expect(location.postcode).to eq("SE1 7QA")
        end
      end
    end
  end
end

