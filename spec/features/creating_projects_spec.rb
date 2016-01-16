require 'rails_helper'
require 'spec_helper'


feature 'Creating projects' do

  before do
    visit '/'

    click_link 'New Project'
  end

  scenario 'can create a project' do
    fill_in 'Name', with: 'Atom100'
    fill_in 'Description', with: 'The coolest text editor which i ever seen.'
    click_button 'Create Project'

    expect(page).to have_content('Project has bean created.')

    project = Project.where(name: 'Atom100').first

    expect(page.current_url).to eql(project_url(project))

    title = 'Atom100 - Projects - Ticketee'

    expect(page).to have_title(title)
  end

  scenario 'can not create blank field Name' do
    click_button 'Create Project'

    expect(page).to have_content('Project has not bean created.')
    expect(page).to have_content("Name can't be blank")
  end
end
