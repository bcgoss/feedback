require 'rails_helper'

RSpec.describe Student, type: :model do
  it 'Displays a formatted phone number' do
    subject = create :student, phone_number: '2234567890'

    expect(subject.display_number).to eq('223-456-7890')
  end

  it { should validate_uniqueness_of :name }
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :phone_number }
  it { should validate_presence_of :phone_number }
  it 'permits valid phone numbers' do
    subject = build :student, phone_number: '2234567890'
    expect(subject.save).to be true
  end

  context 'invalid phone numbers' do
    it 'rejects short phone numbers' do
      subject = build :student, phone_number: '1'
      expect(subject.save).to be false
      expect(subject.errors.full_messages.join'. ').to eq 'Phone number must be 10 digits only'
    end

    it 'rejects long phone numbers' do
      subject = build :student, phone_number: '22345678901'
      expect(subject.save).to be false
      expect(subject.errors.full_messages.join'. ').to eq 'Phone number must be 10 digits only'
    end

    it 'rejects symbols' do
      subject = build :student, phone_number: '(223)456-7890'
      expect(subject.save).to be false
      expect(subject.errors.full_messages.join'. ').to eq 'Phone number must be 10 digits only'
    end
      
    it 'rejects invalid area codes' do
      subject = build :student, phone_number: '1234567890'
      expect(subject.save).to be false
      expect(subject.errors.full_messages.join'. ').to eq 'Phone number must be 10 digits only'
    end

    it 'rejects invalid local codes' do
      subject = build :student, phone_number: '2231567890'
      expect(subject.save).to be false
      expect(subject.errors.full_messages.join'. ').to eq 'Phone number must be 10 digits only'
    end
  end
end
