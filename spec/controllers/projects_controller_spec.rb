require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  it 'display en arror for a missing project' do
    get :show, id: 'not-here'

    expect(response).to redirect_to(projects_path)

    msg = "The project that you looking for does'n exist"

    expect(flash[:alert]).to eql(msg)
  end
end
