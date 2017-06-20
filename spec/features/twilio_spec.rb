require 'rails_helper'

RSpec.describe 'Twilio' do
  before :each do
    @twilio_client = Twilio::REST::Client.new
  end

  it 'can send a text message' do
    VCR.use_cassette('test_message') do
      response = TwilioService.send(to: ENV['TEST_RECIPIANT'], body: 'Test')

      expect(response).to be_a Twilio::REST::Message
      expect(response.status).to eq 'queued'
    end
  end
end
