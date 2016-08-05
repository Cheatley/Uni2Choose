require "rails_helper"

RSpec.describe SearchesController, :type => :controller do
  
  describe "advanced search" do
    it "renders the advanced search template" do
      get :adsearch
      expect(response).to render_template("adsearch")
    end
    it "should contain the links to" do
      {:get => "/users/sign_in" }.should be_routable
      {:get => "/users/sign_up" }.should be_routable      
    end    
  end
  
  describe "keywordsearch" do
    it "renders the keyword search page template" do
      get :keywordsearch
      expect(response).to render_template("keywordsearch")
    end
    it "should contain the links to" do
      {:get => "/contacts" }.should be_routable
    end    
  end



end