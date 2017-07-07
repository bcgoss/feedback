class Lecture < ApplicationRecord
  belongs_to :user
  belongs_to :cohort

  has_many :students, through: :cohort

  alias instructor user
end
