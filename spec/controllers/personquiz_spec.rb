require "rails_helper"

RSpec.describe PersonquizController, :type => :controller do
    
        describe 'GET sbear' do
        it 'displays the correct template' do
            get :sbear
            expect(response).to render_template("sbear")    
        end
    end
            describe 'GET rpanda' do
        it 'displays the correct template' do
            get :rpanda
            expect(response).to render_template("rpanda")    
        end
    end
            describe 'GET alpach' do
        it 'displays the correct template' do
            get :alpach
            expect(response).to render_template("alpach")    
        end
    end
            describe 'GET tiger' do
        it 'displays the correct template' do
            get :tiger
            expect(response).to render_template("tiger")    
        end
    end
    describe 'GET pquiz' do
        it 'displays the correct template' do
            get :pquiz
            expect(response).to render_template("pquiz")    
        end
    end
end