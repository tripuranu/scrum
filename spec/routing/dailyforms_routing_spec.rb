require "rails_helper"

RSpec.describe DailyformsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/dailyforms").to route_to("dailyforms#index")
    end

    it "routes to #new" do
      expect(:get => "/dailyforms/new").to route_to("dailyforms#new")
    end

    it "routes to #show" do
      expect(:get => "/dailyforms/1").to route_to("dailyforms#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/dailyforms/1/edit").to route_to("dailyforms#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/dailyforms").to route_to("dailyforms#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/dailyforms/1").to route_to("dailyforms#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/dailyforms/1").to route_to("dailyforms#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/dailyforms/1").to route_to("dailyforms#destroy", :id => "1")
    end
  end
end
