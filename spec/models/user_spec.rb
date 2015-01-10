require 'spec_helper'

describe User do
  describe 'create' do
    it 'sets password salt' do
      user = Fabricate(:user)
      expect(user.password_salt).not_to be_nil
    end
    it 'sets password hash' do
      password = Faker::Internet.password
      user = Fabricate(:user, password: password)
      expect(user.password_hash).to eq BCrypt::Engine.hash_secret(
        password, user.password_salt)
    end
    it 'username must be present' do
      password = Faker::Internet.password
      user = User.create(password: password)
      expect(user.errors.messages[:username]).to eq ['can\'t be blank']
    end
  end

  describe 'authenticate' do
    it 'authenticates a user' do
      user = Fabricate(:user)
      expect(User.authenticate(user.username, user.password)).to eq user
    end
    it 'does not authenticate bad password' do
      user = Fabricate(:user)
      expect(User.authenticate(user.username, user.password + 'blah')).to eq nil
    end
    it 'does not authenticate bad username' do
      user = Fabricate(:user)
      expect(User.authenticate(user.username + 'blah', user.password)).to eq nil
    end
  end

end
