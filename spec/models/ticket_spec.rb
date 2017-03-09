require 'rails_helper'

RSpec.describe TicketType, type: :model do
	describe '.ticket type' do
		it "returns new ticket" do
			a = TicketType.new(name: 'VIP')
			a.save(validate: false)
			expect(TicketType.last).to eq (a)
		end

		it "returns new ticket false" do
			a = TicketType.new(name: 'VIP')
			a.save(validate: true)
			expect(TicketType.last).to_not eq (a)
		end
	end 

end