require "rails_helper"

RSpec.describe AnalysisController, :type => :controller do
    
        describe 'GET user_analysis index' do
        it 'displays the correct template' do
            get :user_analysis
            expect(response).to render_template("user_analysis")    
        end
    end
end