require 'rails_helper'
require 'spec_helper'

feature 'Creating projects' do
  scenario 'can create a project' do
    visit '/'

    click_link 'New Project'

    fill_in 'Name', with: 'Atom100'
    fill_in 'Description', with: 'The coolest text editor which i ever seen.'
    click_button 'Create Project'

    expect(page).to have_content('Project has bean created.')
  end
end
