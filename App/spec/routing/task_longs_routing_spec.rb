require "rails_helper"

RSpec.describe TaskLongsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/task_longs").to route_to("task_longs#index")
    end

    it "routes to #new" do
      expect(:get => "/task_longs/new").to route_to("task_longs#new")
    end

    it "routes to #show" do
      expect(:get => "/task_longs/1").to route_to("task_longs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/task_longs/1/edit").to route_to("task_longs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/task_longs").to route_to("task_longs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/task_longs/1").to route_to("task_longs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/task_longs/1").to route_to("task_longs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/task_longs/1").to route_to("task_longs#destroy", :id => "1")
    end

  end
end
