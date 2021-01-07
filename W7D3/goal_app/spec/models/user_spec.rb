require 'rails_helper'

RSpec.describe User, type: :model do
  # validating username and password
  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_length_of(:password).is_at_least(6)}

  # subject(:ruby2020) {FactoryBot.create(:user)}



  subject(:ruby2020) {User.create!(username:"ruby2020", password:"password")} 
  # subject(:hello) {'dsada'}

  it { should validate_uniqueness_of(:username) }

  describe "#password" do 
    it "should hash the password" do 
      user = User.new(password: "password")
      expect(user.password_digest).not_to eq("password")
      expect(user.password).to eq("password")
    end
  end


  describe "#is_password?" do
    it "should verify the password" do
      user = User.new(password: 'password')
      expect(user.is_password?('password')).to be true
      expect(user.is_password?('password123')).to be false
    end
  end
  
  describe '#ensure_session_token' do
    it 'should assign a session token upon login' do
      expect(User.new.session_token).not_to be nil
    end
  end

  describe "#reset_session_token!" do
    it 'should reset the session_token' do
      user = User.new(username: 'username', password: 'password')
      old_session_token = user.session_token
      expect(user.reset_session_token!).not_to eq(old_session_token)
    end
  end
  
  describe "::find_by_credentials" do
    it 'should find user from database given username and password' do
      user = User.create(username: 'username', password: 'password')
      expect(User.find_by_credentials(user.username, user.password)).to eq(user)
    end
  end 
  


 
# makes sure that it associates with goals, friends?, comments
  describe "associations" do
    it {should have_many(:goals) }
    it {should have_many(:friends)}
    it {should have_many(:comments)}
  end
      
end





# users table
# 1 Tului 
# 2 Qi
# 3 Lina
# 4 Carlos

# goals table
# 1 'pass all assessments'  1
# 2 'eat healthy'           2


# friends table
# 1   1   2
# 2   2   4
# 3   1   4


# comments
# 1  'body'  goal_id    user_id
