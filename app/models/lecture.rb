class Lecture < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  has_many :students, through: :cohort

  alias instructor user

  def start_time
    start_at.strftime("%B %-d, %Y at %-I:%M%P")
  end

  def end_time
    (start_at + duration.minutes).strftime("%B %-d, %Y at %-I:%M%P")
  end
end
