require 'rails_helper'

RSpec.describe 'Admin' do
  before :each do
    @admin = create :user, email: 'admin@example.com', role: 2
    sign_in @admin
  end

  it 'Views users' do
    create :user, email: 'example@example.com', role: 0
    create :user, email: 'test@example.com', role: 1

    visit admin_users_path

    expect(page).to have_content('example@example.com')
    expect(page).to have_content('Unverified')

    expect(page).to have_content('test@example.com')
    expect(page).to have_content('Approved')
  end

  it 'Views a user' do
    subject = create :user, email: 'example@example.com', role: 0

    visit admin_user_path(subject)

    expect(page).to have_content('example@example.com')
    expect(page).to have_content('Unverified')
    expect(page).to have_link('Approve')
    expect(page).to have_link('Make Administrator')
  end

  it 'Approves a user' do
    subject = create :user, email: 'example@example.com', role: 0
   
    visit admin_user_path(subject)
    click_link 'Approve'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Approve')
    expect(User.find(subject.id).role).to eq 'approved'
  end

  it 'Revokes a user' do
    subject = create :user, email: 'example@example.com', role: 1
   
    visit admin_user_path(subject)
    click_link 'Revoke'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Revoke')
    expect(subject.role).to eq 'unverified'
  end
end
