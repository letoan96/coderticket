require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /events" do
    it "loads index events" do
			b = Event.create!(name: "Scorpion in Vietnam", starts_at: 1.days.from_now, ends_at: 10.days.from_now, extended_html_description: " a future event",
                    venue: Venue.new, category: Category.new)
	 		get root_path
	 		expect(response.body).to include "Scorpion in Vietnam"
		end
  end
end
