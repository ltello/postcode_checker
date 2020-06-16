describe ServicesController do
  describe "GET check" do
    context "when postcode param not provided" do
      before do
        get :check
      end

      it "do not assign @postcode" do
        expect(assigns(:postcode)).not_to be_present
      end

      it "do not assign @message" do
        expect(assigns(:message)).not_to be_present
      end

      it "renders the check template" do
        expect(response).to render_template("check")
      end

      it "responds successfully" do
        expect(response).to have_http_status(:ok)
      end

      it "returns html content" do
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end
    end

    context "when postcode param provided" do
      before do
        get :check, params: { postcode: "SE1 HHH" }
      end

      it "assigns @postcode" do
        expect(assigns(:postcode)).to be_present
      end

      it "assigns @message" do
        expect(assigns(:message)).to be_present
      end

      it "renders the check template" do
        expect(response).to render_template("check")
      end

      it "responds successfully" do
        expect(response).to have_http_status(:ok)
      end

      it "returns html content" do
        expect(response.content_type).to eq "text/html; charset=utf-8"
      end
    end
  end
end
