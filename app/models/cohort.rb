class Cohort < ApplicationRecord
  validates_uniqueness_of :graduation_year
  has_many :students
  has_many :lectures
end
