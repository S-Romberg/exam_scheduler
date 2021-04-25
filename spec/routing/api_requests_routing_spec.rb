require "rails_helper"

RSpec.describe ApiRequestsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api_requests").to route_to("api_requests#index")
    end

    it "routes to #show" do
      expect(get: "/api_requests/1").to route_to("api_requests#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api_requests").to route_to("api_requests#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api_requests/1").to route_to("api_requests#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api_requests/1").to route_to("api_requests#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api_requests/1").to route_to("api_requests#destroy", id: "1")
    end
  end
end
