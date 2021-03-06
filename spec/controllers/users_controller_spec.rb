require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "returns new use" do
      get :new
      expect(response).to render_template(:new) 
    end


  end
end
