describe ServableArea do
  context "database columns" do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(primary: true) }
    it { is_expected.to have_db_column(:lsoa).of_type(:string) .with_options(null: false) }
  end

  context "database indexes" do
    it { is_expected.to have_db_index(:lsoa) }
  end

  context "validations" do
    subject { build(:servable_area) }

    it { is_expected.to validate_presence_of(:lsoa) }
    it { is_expected.to validate_uniqueness_of(:lsoa).case_insensitive }
  end

  context "class methods" do
    describe ".with_lsoa(lsoa)" do
      let!(:servable_area) { create(:servable_area, lsoa: "Lambeth 036B") }
      let(:result)         { described_class.with_lsoa(lsoa) }

      context "when no area with the given lsoa can be found" do
        let(:lsoa) { "Lambeth 036A" }

        it "return no areas" do
          expect(result).to be_empty
        end
      end

      context "when an area with the given lsoa exists" do
        let(:lsoa) { "Lambeth 036B" }

        it "include the area in the response" do
          expect(result.to_a).to include(servable_area)
        end
      end
    end
  end
end
