require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  describe 'password' do
    it 'should have a password and confirmation to save' do
      u = User.create(name: 'Beverly')
      u.save

      expect(u).to_not be_valid

      u.password = 'password'
      u.password_confirmation = ''
      u.save

      expect(u).to_not be_valid

      u.password_confirmation = 'password'

      expect(u).to be_valid
    end

    it 'should password and confirmation be the same' do
      u = User.create(
            name: 'Beverly',
            password: 'pass',
            password_confirmation: 'invalid-pass')
      expect(u).to_not be_valid
    end
  end

  describe "authentication" do
    let(:user) { User.create(
                  name: 'Beverly',
                  password: 'pass',
                  password_confirmation: 'pass') }

    it 'should authenticate with correct password' do
      expect(user.authenticate('pass')).to be
    end

    it "should not authenticate with incorrent password" do
      expect(user.authenticate('invalid-password')).to_not be
    end
  end
end
