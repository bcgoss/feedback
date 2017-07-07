FactoryGirl.define do
  factory :lecture do
    user
    cohort
    start_at "2017-07-05 16:00:19"
    duration 1
  end
end
