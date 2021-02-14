require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures name presence' do
      user = User.new(email: "test@mail.com", password: "password").save
      expect(user).to eq(false)
    end

    it 'ensures email presence' do
      user = User.new(name: "Test Lama", password: "password").save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do 
      user = User.new(name: "Test Lama", email: "test@mail.com").save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(name: "Test Lama", email: "test@mail.com", password: "password").save
      expect(user).to eq(true)
    end
  end
end
