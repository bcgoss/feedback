require 'rails_helper'

RSpec.describe Lecture do
  before :each do
    user = create :user, email: 'dummy@example.com'
    sign_in user
  end

  it 'it shows a lecture' do
    cohort = create :cohort
    subject = create :lecture, start_at: "2017-07-05 16:00:00", duration: 60, cohort: cohort

    visit cohort_lecture_path cohort.id, subject.id

    expect(page).to have_content("Lecture begins: June 5th, 2017 at 4pm")
    expect(page).to have_content("Lecture ends: June 5th, 2017 at 5pm")
  end
end
