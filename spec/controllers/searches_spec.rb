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
  
  describe "personality quiz" do
    it "renders the personality quiz template" do
      get :quiz
      expect(response).to render_template("quiz")
    end
    it "should contain the links to" do
      {:get => "/contacts" }.should be_routable
    end    
  end

  describe "recommender quiz" do
    it "renders the recommender quiz template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end