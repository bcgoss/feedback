class Student < ApplicationRecord
  belongs_to :cohort

  validates :name, presence: true, uniqueness: true
  validates :phone_number, presence: true, uniqueness: true

  # the regex matches a 10 digit number with no symbols.
  # Optional leading 1 for country code
  # Area Code cannot being with 1
  # Local Code cannot begin with 1
  validates :phone_number, format: { with: /\A1?[2-9]\d\d[2-9]\d{6}\z/, message: 'must be 10 digits only' }
  def display_number
    "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..-1]}"
  end
end
