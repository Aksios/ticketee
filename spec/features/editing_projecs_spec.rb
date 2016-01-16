require 'rails_helper'
require 'spec_helper'

feature 'Editing Project' do
  before do
    FactoryGirl.create(:project, name: 'ParfenProject')

    visit '/'
    click_link 'ParfenProject'
    click_link 'Edit Project'
  end

  scenario 'update the project' do
    fill_in 'Name', with: 'ParfenBestProject'
    click_button 'Update Project'

    expect(page).to have_content('Project has been updated.')
  end

  scenario 'can not have blank Name' do
    fill_in 'Name', with: ''
    click_button 'Update Project'

    expect(page).to have_content("Project has not been update")
  end
end
