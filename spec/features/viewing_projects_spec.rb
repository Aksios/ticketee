require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Viewing Projects' do
  scenario 'viewing all list projects' do
    project = FactoryGirl.create(:project, name: 'AtomAtom')

    visit '/'
    click_link 'AtomAtom'

    expect(page.current_url).to eql(project_url(project))
  end
end
