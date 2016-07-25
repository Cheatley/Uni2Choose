require "rails_helper"

RSpec.describe SearchesController, :type => :controller do
  describe "advanced search" do
    
    it "renders the advanced search template" do
      get :adsearch
      expect(response).to render_template("adsearch")
     

    end
    
  end
end