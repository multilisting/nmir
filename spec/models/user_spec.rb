require 'rails_helper'

RSpec.describe User, :type => :model do

  describe 'has some fields and' do
    subject(:user) { new_user }
    
    it { expect(user).to respond_to(:name) }
    it { expect(user).to respond_to(:blocked) }
    it { expect(user).to respond_to(:role) }
    it { expect(user).to respond_to(:from_admin) }
  end
end

def new_user
  User.new({
    name: 'asdsdsd',
    email: 'asd@asd.ru',
    role: :owner,
    password: '11111111',
    password_confirmation: '11111111'
  })
end
