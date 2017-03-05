# Feature: 'index' page
# As a visitor
# I want to see upcoming events when I go to 'index' page


RSpec.feature 'routing to /upcoming', type: 'routing' do

	 it '/upcoming' do
	 	visit root_path
	 	expect(page).to have_content "Discover upcoming events"
	 end
end



