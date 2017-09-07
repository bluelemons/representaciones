require 'rails_helper'

describe User do
  it { have_many :permitions }
  it { have_many :roles }

  let :role do
    FactoryGirl.build :role
  end

  let :user do
    FactoryGirl.build :user
  end

  subject do
    user.roles << role
    user
  end

  describe 'role' do
    it 'returns a array of user roles' do
      expect(subject.role).to eq [role.name]
    end
  end

  describe 'role_symbols' do
    it 'returns a array of user symbols roles' do
      expect(subject.role_symbols).to eq [role.name.to_sym]
    end
  end

  describe 'role?' do
    it 'will be true is the user has the given rol' do
      expect(subject.role?(role.name)).to be_truthy
    end

    it 'will be false is the user hasn\'t the given rol' do
      expect(subject.role?('unknow')).to be_falsy
    end
  end

end
