require 'spec_helper'
require 'rails_helper'

feature 'Deleting Project' do
  scenario 'delete project' do
    @project = FactoryGirl.create(:project, name: 'Parfen')

    visit '/'
    click_link 'Parfen'
    click_link 'Delete Project'

    expect(page).to have_content('Project has been deleted')

    visit '/'

    expect(page).to have_no_content('Parfen')
  end
end
