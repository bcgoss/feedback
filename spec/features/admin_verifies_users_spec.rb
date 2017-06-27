require 'rails_helper'

RSpec.describe 'Admin' do
  before :each do
    @admin = create :user, email: 'admin@example.com', role: 2
    sign_in @admin
  end

  it 'Views users' do
    create :user, email: 'example@example.com', role: 'unverified'
    create :user, email: 'test@example.com', role: 'approved'

    visit admin_users_path

    expect(page).to have_content('example@example.com')
    expect(page).to have_content('Unverified')

    expect(page).to have_content('test@example.com')
    expect(page).to have_content('Approved')
  end

  it 'Views a user' do
    subject = create :user, email: 'example@example.com', role: 'unverified'

    visit admin_user_path(subject)

    expect(page).to have_content('example@example.com')
    expect(page).to have_content('Unverified')
    expect(page).to have_link('Approve')
    expect(page).to have_link('Make Administrator')
  end

  it 'Approves a user' do
    subject = create :user, email: 'example@example.com', role: 'unverified'
   
    visit admin_user_path(subject)
    click_link 'Approve'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Approve')
    expect(User.find(subject.id).role).to eq 'approved'
  end

  it 'Revokes a user' do
    subject = create :user, email: 'example@example.com', role: 'approved'
   
    visit admin_user_path(subject)
    click_link 'Revoke'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Revoke')
    expect(User.find(subject.id).role).to eq 'unverified'
  end

  it 'Makes a user an administrator' do
    subject = create :user, email: 'example@example.com', role: 'approved'
   
    visit admin_user_path(subject)
    click_link 'Make Administrator'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Make Administrator')
    expect(User.find(subject.id).role).to eq 'admin'
  end

  it 'Makes a user not an administrator' do
    subject = create :user, email: 'example@example.com', role: 'admin'
   
    visit admin_user_path(subject)
    click_link 'Revoke Administrator'

    expect(current_path).to eq admin_user_path(subject)
    expect(page).to_not have_link('Revoke Aministrator')
    expect(User.find(subject.id).role).to eq 'approved'
  end
end
