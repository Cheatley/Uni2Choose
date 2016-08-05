require "rails_helper"

RSpec.describe QuizController, :type => :controller do
    
        describe 'GET art' do
        it 'displays the correct template' do
            get :art
            expect(response).to render_template("art")    
        end
    end
            describe 'GET bio' do
        it 'displays the correct template' do
            get :bio
            expect(response).to render_template("bio")    
        end
    end
            describe 'GET draw' do
        it 'displays the correct template' do
            get :draw
            expect(response).to render_template("draw")    
        end
    end
            describe 'GET hum' do
        it 'displays the correct template' do
            get :hum
            expect(response).to render_template("hum")    
        end
    end
    describe 'GET lan' do
        it 'displays the correct template' do
            get :lan
            expect(response).to render_template("lan")    
        end
    end
        describe 'GET law' do
        it 'displays the correct template' do
            get :law
            expect(response).to render_template("law")    
        end
    end
        describe 'GET lin' do
        it 'displays the correct template' do
            get :lin
            expect(response).to render_template("lin")    
        end
    end
        describe 'GET mainquiz' do
        it 'displays the correct template' do
            get :mainquiz
            expect(response).to render_template("mainquiz")    
        end
    end
        describe 'GET math' do
        it 'displays the correct template' do
            get :math
            expect(response).to render_template("math")    
        end
    end
        describe 'GET phys' do
        it 'displays the correct template' do
            get :phys
            expect(response).to render_template("phys")    
        end
    end
end