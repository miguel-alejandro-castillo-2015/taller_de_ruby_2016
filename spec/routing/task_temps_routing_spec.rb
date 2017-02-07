require "rails_helper"

RSpec.describe TaskTempsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_temps").to route_to("task_temps#index")
    end

    it "routes to #new" do
      expect(:get => "/task_temps/new").to route_to("task_temps#new")
    end

    it "routes to #show" do
      expect(:get => "/task_temps/1").to route_to("task_temps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_temps/1/edit").to route_to("task_temps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_temps").to route_to("task_temps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_temps/1").to route_to("task_temps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_temps/1").to route_to("task_temps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_temps/1").to route_to("task_temps#destroy", :id => "1")
    end

  end
end
