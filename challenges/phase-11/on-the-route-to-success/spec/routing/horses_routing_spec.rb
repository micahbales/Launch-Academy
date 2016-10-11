require "rails_helper"

RSpec.describe HorsesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/horses").to route_to("horses#index")
    end

    it "routes to #new" do
      expect(:get => "/horses/new").to route_to("horses#new")
    end

    it "routes to #show" do
      expect(:get => "/horses/1").to route_to("horses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/horses/1/edit").to route_to("horses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/horses").to route_to("horses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/horses/1").to route_to("horses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/horses/1").to route_to("horses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/horses/1").to route_to("horses#destroy", :id => "1")
    end

  end
end
