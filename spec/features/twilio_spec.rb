require 'rails_helper'

RSpec.describe 'Twilio' do
  before :each do
    account_sid = ENV['TWILIO_TEST_ACCOUNT_SID']
    auth_token = ENV['TWILIO_TEST_AUTH_TOKEN']
    @twilio_client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  it 'can send a text message' do
    VCR.use_cassette('test_message') do
      response = @twilio_client.messages.create(
        from: '15005550006', # twilio test 'No Error'
        to: ENV['TEST_RECIPIANT'],
        body: 'Test'
      )

      expect(response).to be_a Twilio::REST::Message
      expect(response.status).to eq 'queued'
    end
  end
end
