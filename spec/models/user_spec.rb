require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it 'must be valid with valid fields entered' do
      @user = User.new(
      name: 'john',
      email: 'test@test.com',
      password: '12345',
      password_confirmation: '12345'
      )
      expect(@user.valid?).to be(true)
    end
    
    it 'must be created with a password and password_confirmation fields' do
      @user = User.new(
      name: 'john',
      email: 'test@test.com'
      )
      expect(@user.valid?).to be(false)
    end

    it 'must have password and password_confirmation matching' do
      @user = User.new
      params = {
      email: 'test@test.com',
      password: 12345,
      password_confirmation: 'password'
      }
      expect(@user.save).to be(false)
    end

    it 'should not be valid if password is less than 5 characters' do
      @user = User.new
      params = {
      name:'John',
      email: 'john@com',
      password:'1234',
      password_confirmation:'1234'
      }
      expect(@user.save).to be(false)
    end

    #Validate : Email, first name, and last name should also be required
    it 'should not be valid without email, first name, and last name' do
      @user = User.new
      params = {
      name:nil,
      email: nil,
      password:'12345',
      password_confirmation:'12345'
      }
      expect(@user.save).to be(false)
    end

    # Emails must be unique (not case sensitive)
    it "should not be valid if email already exists in db" do
      params1 = {
      name:'john',
      email: 'john@com',
      password:'12345',
      password_confirmation:'12345'
      }

      params2 = {
      name:'john',
      email: 'john@com',
      password:'12345',
      password_confirmation:'12345'
      }
      @user1 = User.create
      @user2 = User.new
      expect(@user2.valid?).to be(false)
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "checks the login and returns the authenticated user" do
        user = User.create(name: "jane", :email => "jane@com", :password => "12345", :password_confirmation => "12345")
        authenticated_user = User.authenticate_with_credentials("jane@com", "12345")
        expect(authenticated_user).to eq(user)
    end

    it "checks the login and returns nill if the login does not validate" do
      user = User.create(name: "jane", :email => "jane@com", :password => "12345", :password_confirmation => "12345")
      authenticated_user = User.authenticate_with_credentials("john@com", "12345")
      expect(authenticated_user).to eq(nil)
  end

    it "checks the login and returns authenticated user regardless of trailing spaces or capitalization" do
    user = User.create(name: "jane", :email => "jane@com", :password => "12345", :password_confirmation => "12345")
    authenticated_user = User.authenticate_with_credentials("Jane@com ", "12345")
    expect(authenticated_user).to eq(user)
  end

  end

end
