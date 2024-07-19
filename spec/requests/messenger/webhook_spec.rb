RSpec.describe "Get /messenger_webhook", type: [:request] do
  let(:messenger_webhook_verification_token) { 1 }

  context "when Facebook send us a verification request" do
    it "should pass" do
      get "/messenger_webhook"
      expect(last_response).to be_successful
    end
  end

end
