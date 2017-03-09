require 'rails_helper'

RSpec.describe Event, type: :model do
	describe '.upcoming' do
		it "returns upcoming events" do
			a = Event.new(starts_at: 1.day.from_now, published_at: 1.day.ago)
			b = Event.new(starts_at: 2.day.from_now, published_at: 2.day.ago)
			a.save(validate: false)
			b.save(validate: false)
			expect(Event.upcoming).to eq [a,b]
		end
	end 

	describe '.search' do 
		it "returns search results" do
			a = Event.new(name: 'test model', starts_at: 1.day.from_now, published_at: 1.day.ago)
			a.save(validate: false)
			expect(Event.search('test')).to eq [a]
		end
	end

	describe '.search' do 
		it "returns published event" do
			a = Event.new(name: 'test model', starts_at: 1.day.from_now)
			b = Event.new(starts_at: 2.day.from_now, published_at: 2.day.ago)
			a.save(validate: false)
			b.save(validate: false)
			expect(Event.upcoming).to eq [b]
		end
	end



end