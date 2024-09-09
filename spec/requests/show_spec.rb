require 'rails_helper'

RSpec.describe "Shows", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/show/show"
      expect(response).to have_http_status(:success)
    end
  end

end
