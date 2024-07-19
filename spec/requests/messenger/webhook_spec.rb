RSpec.describe "Get /messenger_webhook", type: [:request] do
  let(:messenger_webhook_verification_token) { 1 }


      #hub.verification_token antes era hub.token
  def wrong_challenge_params
    { 'hub.mode'     => "subscribe",
      'hub.token'     => -1,
      'hub.challenge' => 989 }
  end

  def right_challenge_params
    { 'hub.mode'      => "subscribe",
      'hub.verify_token'     => "2",
      'hub.challenge' => 989 }
  end

  context "when Facebook send us a verification request" do
    it "should pass" do
      get "/messenger_webhook?hub.challenge=1"
      expect(last_response).to be_successful
      body = JSON.parse(last_response.body)
      puts body
#      expect(body["challenge"]).to eq "2"
    end
  end

end
