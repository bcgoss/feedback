require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'Displays a formatted phone number' do
    subject = create :student, phone_number: '2234567890'

    expect(subject.display_number).to eq('223-456-7890')
  end
end
