require "rails_helper"

RSpec.describe ErrorsController, :type => :controller do
  
  describe "errors" do
    it "renders the 404 template" do
      get :not_found
      expect(response).to render_template("not_found")
    end
    it "renders the 422 template" do
      get :unprocessable_entity
      expect(response).to render_template("unprocessable_entity")
    end
    it "renders the 500 template" do
      get :internal_server_error
      expect(response).to render_template("internal_server_error")
    end
    it "should contain the links to" do
      {:get => "/adsearch" }.should be_routable
      {:get => "/" }.should be_routable
    end
  end
end