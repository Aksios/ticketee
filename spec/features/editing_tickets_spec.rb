require 'rails_helper'
require 'spec_helper'

feature 'Editing tickets' do
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do
    visit '/'
    click_link project.name
    click_link ticket.title
    click_link 'Edit Ticket'
  end

  scenario 'Updated the ticket' do
    fill_in 'Title', with: 'New title'
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket has been updated.')

    within('#ticket h2') do
      expect(page).to have_content('New title')
    end

    expect(page).to_not have_content ticket.title
  end

  scenario 'Updated ticket with invalid information' do
    fill_in 'Title', with: ''
    click_button 'Update Ticket'

    expect(page).to have_content('Ticket has not been updated.')
    #expect(page).to have_content("Title can't be blank")
  end
end
