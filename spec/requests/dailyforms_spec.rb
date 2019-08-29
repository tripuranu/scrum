require 'rails_helper'

RSpec.describe "Dailyforms", type: :request do
  describe "GET /dailyforms" do
    it "works! (now write some real specs)" do
      get dailyforms_path
      expect(response).to have_http_status(200)
    end
  end
end
