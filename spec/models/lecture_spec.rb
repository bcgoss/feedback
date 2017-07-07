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

  end

  it 'formats end time' do

  end
end
