require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.creat_user' do
		it "returns user" do
			a = User.new(email: 'test@gmail.com')
			a.save(validate: false)
			expect(User.last).to eq (a)
		end
	end  

	describe '.creat_user_fails' do
		it "returns false" do
			a = User.new(email: 'test@gmail.com')
			a.save
			expect(a.save).to eq (false)
		end
	end 

	describe '.creat_user_success' do
		it "returns success" do
			a = User.new(email: 'test@gmail.com', password: '123456')
			a.save
			expect(User.last).to eq (a)
		end
	end 
end
