require 'spec_helper'
require 'rails_helper'

feature 'Creating Ticket' do
  before do
    FactoryGirl.create(:project, name: 'Atom')

    visit '/'
    click_link 'Atom'
    click_link 'New Ticket'
  end

  scenario 'Creating new ticket' do
    fill_in 'Title', with: 'Ticket number 1'
    fill_in 'Description', with: 'This is description'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has been created.')
  end

  scenario 'Creating a ticket without valid attributes fails' do
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
  end

  scenario "Creating a ticket with description's length greater than 10 characters" do
    fill_in 'Title', with: 'Title good'
    fill_in 'Description', with: 'short'
    click_button 'Create Ticket'

    expect(page).to have_content('Ticket has not been created.')
    expect(page).to have_content('Description is too short')
  end
end
