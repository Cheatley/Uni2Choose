require "rails_helper"

RSpec.describe PagesController, :type => :controller do
  
  describe "GET #home" do
    it "renders the home template" do
      get :home
      expect(response).to render_template("home")
    end
    it "should contain the links to" do
      {:get => "/adsearch" }.should be_routable
      {:get => "/new" }.should be_routable      
      {:get => "/quiz" }.should be_routable
      {:get => "/about" }.should be_routable
    end
  end
  
  describe "GET #about" do
    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end
  
    describe "GET #help" do
    it "renders the help template" do
      get :help
      expect(response).to render_template("help")
    end
  end
  
    describe "GET #unis" do
    it "renders the about template" do
      get :unis
      expect(response).to render_template("unis")
    end
  end
  
      describe "GET #privacy" do
    it "renders the about template" do
      get :privacy
      expect(response).to render_template("privacy")
    end
  end
  
end