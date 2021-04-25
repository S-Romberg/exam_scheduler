require "rails_helper"

RSpec.describe ExamWindowsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/exam_windows").to route_to("exam_windows#index")
    end

    it "routes to #show" do
      expect(get: "/exam_windows/1").to route_to("exam_windows#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/exam_windows").to route_to("exam_windows#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/exam_windows/1").to route_to("exam_windows#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/exam_windows/1").to route_to("exam_windows#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/exam_windows/1").to route_to("exam_windows#destroy", id: "1")
    end
  end
end
