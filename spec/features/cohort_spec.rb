require 'rails_helper'

RSpec.describe Cohort do
  context 'a signed in user' do
    before :each do
      @user = create :user
      sign_in @user
    end

    it 'shows a cohort' do
      
      subject = create :cohort, graduation_year: '2017'

      visit cohort_path subject.id

      expect(page).to have_content('Year of Graduation: 2017')
    end

    it 'lists all cohorts' do

      create :cohort, graduation_year: '2017'
      create :cohort, graduation_year: '2018'

      visit cohorts_path
      within "ul" do 
        expect(page).to have_link('Class of 2017')
        expect(page).to have_link('Class of 2018')
      end
    end

    it 'updates a cohort' do
      subject = create :cohort, graduation_year: '2016'

      visit edit_cohort_path subject.id

      fill_in 'cohort_graduation_year', with: '2017'
      click_on 'Update Cohort'

      expect(page).to have_content('Cohort updated')
      expect(page).to have_content('Year of Graduation: 2017')
    end

    it 'creates a cohort' do
      visit new_cohort_path

      fill_in 'cohort_graduation_year', with: '2017'
      click_on 'Create Cohort'

      expect(page).to have_content('Cohort Created')
      expect(page).to have_content('Year of Graduation: 2017')
    end
  end
end
