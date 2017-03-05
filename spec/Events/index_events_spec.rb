# Feature: 'index' page
# As a visitor
# I want to see upcoming events when I go to 'index' page


RSpec.describe '/upcoming', type: :model  do

	 describe '.upcoming' do
	 	it "returns upcoming events" do
	 		a = Event.new starts_at: 1.day.from_now
	 		b = Event.new starts_at: 1.day.ago
	 		a.save(validate: false)
	 		b.save(validate: false)
	 		expect(Event.upcoming).to eq [a]
	 	end
	end 


end



