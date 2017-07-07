require 'rails_helper'

RSpec.describe Lecture do
  before :each do
    user = create :user, email: 'dummy@example.com'
    sign_in user
  end

  it 'it shows a lecture' do
    cohort = create :cohort
    subject = create :lecture, start_at: "2017-07-05 16:00:00", duration: 90, cohort: cohort

    visit cohort_lecture_path cohort.id, subject.id

    expect(page).to have_content("Lecture begins: July 5, 2017 at 4:00pm")
    expect(page).to have_content("Lecture ends: July 5, 2017 at 5:30pm")
  end

  it 'lists lectures for a cohort' do
    cohort = create :cohort
    instructor = create :user
    create :lecture, start_at: "2017-07-05 16:00:00", duration: 90, cohort: cohort, user: instructor
    create :lecture, start_at: "2017-07-12 16:00:00", duration: 90, cohort: cohort, user: instructor

    visit cohort_lectures_path cohort.id

    expect(page).to have_content("July 5, 2017 at 4:00pm")
    expect(page).to have_content("July 12, 2017 at 4:00pm")
  end
end
