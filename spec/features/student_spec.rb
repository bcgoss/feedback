require 'rails_helper'

RSpec.describe Student do
  before(:each) do
    @user = create :user
    sign_in @user
  end

  it 'shows a student' do
    subject = create :student, name: 'Student 1', phone_number: '5555555555'
    
    visit student_path(subject.id)

    expect(page).to have_content 'Student 1'
    expect(page).to have_content '555-555-5555'
  end

  it 'lists all students' do
    create :student, name: 'Student 1' 
    create :student, name: 'Student 2'

    visit students_path

    expect(page).to have_link 'Student 1'
    expect(page).to have_link 'Student 2'
  end

  it 'creates new students' do

    visit new_student_path

    fill_in 'Name', with: 'Student 1'
    fill_in 'Phone number', with: '5555555555'
    click_on 'Create Student'

    expect(current_path).to eq students_path
  end

  it 'updates a student' do
    subject = create :student, name: 'Student 1', phone_number: '5555555555'

    visit student_path(subject.id)
    click_on 'Edit'

    fill_in 'Name', with: 'Student A'
    fill_in 'Phone number', with: '2234567890'
    click_on 'Update Student'

    expect(page).to have_content 'Student A'
    expect(page).to have_content '223-456-7890'
  end
end
