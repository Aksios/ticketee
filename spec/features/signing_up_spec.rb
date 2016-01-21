require 'rails_helper'
require 'spec_helper'

feature 'Signing Up' do
  scenario 'Successful sign up' do
    visit '/'

    click_link 'Sign up'
    fill_in 'Email', with: 'bev@mail.com'
    fill_in 'Password', with: 'pass1'
    fill_in 'Password confirmation', with: 'pass1'
    click_button 'Sign up'

    expect(page).to have_content('You have signed up successfully.')

  end
end
