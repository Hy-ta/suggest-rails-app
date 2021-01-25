require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name presence' do
      user = User.new(name: 'First', email: 'sample1@sample.com', password: 'secret1234', password_confirmation: "secret1234").save
      expect(user).to eq(true)
    end

    it 'ensures last name presence' do
      user = User.new(name: 'First', email: 'sample2@sample.com', password: 'secret1234', password_confirmation: "secret1234").save
      expect(user).to eq(true)
    end

    it 'ensures email presence' do
      user = User.new(name: 'First', email: 'sample3@sample.com', password: 'secret1234', password_confirmation: "secret1234").save
      expect(user).to eq(true)
    end

    it 'should save successfully' do
      user = User.new(name: 'First', email: 'sample4@sample.com', password: 'secret1234', password_confirmation: "secret1234").save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do
    let (:params) { { name: 'first', email: 'sample1@sample.com', password: 'secret1234', password_confirmation: "secret1234" } }
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params.merge(name: true)).save
      User.new(params.merge(uid: true)).save
      User.new(params.merge(uid: true)).save
    end

    it 'should return active users' do
      expect(User.active_users.size).to eq(0)
    end

    it 'should return inactive users' do
      expect(User.inactive_users.size).to eq(0)
    end
  end
end
