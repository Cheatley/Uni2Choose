require "rails_helper"

RSpec.describe ContactsController, :type => :controller do
  
  describe "contact form" do
    it "renders the contact template" do
      get :new
      expect(response).to render_template("new")
    end
    it "should contain the links to" do
      {:get => "/adsearch" }.should be_routable
      {:get => "/" }.should be_routable
    end
  end
end