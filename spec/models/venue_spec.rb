require 'rails_helper'

RSpec.describe TicketType, type: :model do
	describe '.venue' do
		it "returns new venue => false" do
			a = Venue.new(name: 'VIP', full_address: 'asdasdasd')
			a.save(validate: true)
			expect(Venue.last).to_not eq (a)
		end

		it "returns new venue " do
			a = Venue.new(name: 'VIP', full_address: 'asdasdasd')
			b = Region.new(name: 'Ho Chi Minh')
			b.save
			a[:region_id]=b.id
			a.save(validate: true)
			expect(Venue.last).to eq (a)
		end
		
	end 

end