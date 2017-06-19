class Student < ApplicationRecord
  def display_number
    "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..-1]}"
  end
end
