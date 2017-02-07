require 'rails_helper'

RSpec.describe "TaskLongs", type: :request do
  describe "GET /task_longs" do
    it "works! (now write some real specs)" do
      get task_longs_path
      expect(response).to have_http_status(200)
    end
  end
end
