class TwilioService
  def initialize
    @client = Twilio::REST::Client.new
    @from_number = ENV['TWILIO_NUMBER']
  end

  def send(to:, body:, from: from_number)
    begin
      @client.account.messages.create(to: to, body: body, from: from)
    rescue Twilio::REST::RequestError => error
      error
    end
  end

  def self.send(message_params)
    new.send(message_params)
  end

  private

  attr_reader :from_number
end
