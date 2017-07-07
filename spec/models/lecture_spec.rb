require 'rails_helper'

RSpec.describe Lecture, type: :model do
  it { should have_many :students }
  it { should belong_to :user } 

  it 'responds to instructor' do
    instructor = create :user
    subject = create :lecture, user: instructor

    expect(subject.instructor).to eq instructor
  end

  it 'formats start time' do
    subject = create :lecture, start_at: "2017-07-05 16:00:00"

    expected = "July 5, 2017 at 4:00pm"

    expect(subject.start_time).to eq expected
  end

  it 'formats end time' do
    subject = create :lecture, start_at: "2017-07-05 16:00:00", duration: 90

    expected = "July 5, 2017 at 5:30pm"

    expect(subject.end_time).to eq expected
  end
end
