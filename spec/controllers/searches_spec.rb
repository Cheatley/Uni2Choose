require "rails_helper"

RSpec.describe SearchesController, :type => :controller do
  describe "advanced search" do
    it "displays the scotland regions map" do
      get :adsearch
      response.should render_template(:partial => 'regions')
    end
  end
end