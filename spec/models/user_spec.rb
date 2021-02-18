require 'rails_helper'

RSpec.describe User, type: :model do
  # context 'validation tests' do
  #   it 'ensures name presence' do
  #     user = User.new(email: "test@mail.com", password: "password").save
  #     expect(user).to eq(false)
  #   end

  #   it 'ensures email presence' do
  #     user = User.new(name: "Test Lama", password: "password").save
  #     expect(user).to eq(false)
  #   end

  #   it 'ensures password presence' do 
  #     user = User.new(name: "Test Lama", email: "test@mail.com").save
  #     expect(user).to eq(false)
  #   end

  #   it 'should save successfully' do
  #     user = User.new(name: "Test Lama", email: "test@mail.com", password: "password").save
  #     expect(user).to eq(true)
  #   end
  # end

  describe User do
    let(:attributes) do
      {
        name: "Test Lama",
        email: "test@mail.com",
        password: "password"
      }
    end

    it "is considered valid" do
      expect(User.new(attributes)).to be_valid
    end

    let(:missing_name) { attributes.except(:name) }
    let(:missing_email) { attributes.except(:email) }
    let(:missing_password) { attributes.except(:password) }

    it "is invalid without a name" do 
      expect(User.new(missing_name)).not_to be_valid
    end

    it "is invalid without an email" do
      expect(User.new(missing_email)).not_to be_valid
    end

    it "is invalid without a password" do
      expect(User.new(missing_password)).not_to be_valid
    end
  end
end
