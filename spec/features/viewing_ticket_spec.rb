require 'rails_helper'
require 'spec_helper'

feature 'Viewing Ticket' do
  scenario 'listing tickets of project' do
    proj_1 = FactoryGirl.create(:project, name: 'USA project')
    FactoryGirl.create(:ticket, project: proj_1, title: 'USA ticket', description: 'USA description')

    proj_2 = FactoryGirl.create(:project, name: 'Russia project')
    FactoryGirl.create(:ticket, project: proj_2, title: 'Russia ticket', description: 'Russia description')

    visit '/'

    click_link 'USA project'

    expect(page).to have_content('USA ticket')
    expect(page).to_not have_content('Russia ticket')

    #within ("#title h2") do
      expect(page).to have_content('USA ticket')
    #end

    expect(page).to have_content('USA description')
  end
end
