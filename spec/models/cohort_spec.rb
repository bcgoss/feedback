require 'rails_helper'

RSpec.describe Cohort, type: :model do
  it { should validate_uniqueness_of :graduation_year }
  it { should have_many :students }
  it { should have_many :lectures }
end
