require 'rails_helper'

RSpec.describe 'Twilio' do
  before :each do
    @twilio_client = Twilio::REST::Client.new
  end

  it 'can send a text message' do
    response = @twilio_client.messages.create(
      from: '15036766379',
      to: ENV['TEST_NUMBER'],
      body: 'Test'
    )
  end
end
