# Feature: 'index' page
# As a visitor
# I want to see upcoming events when I go to 'index' page

RSpec.feature 'routing to /upcoming', type: 'routing' do

	 it 'Go to /upcoming' do
	 	visit root_path
	 	expect(page).to have_content "Discover upcoming events"
	 end

	 it 'Go to /events' do
	 	expect(get: "/events").to route_to(controller: "events", action: "index")
	 end
end



