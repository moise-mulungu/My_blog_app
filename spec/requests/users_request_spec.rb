require 'rails_helper'

RSpec.describe 'Users', type: :request do
    describe 'GET /#index' do
    before(:example) { get users_path } 
        it 'returns http success' do
            expect(response).to have_http_status(:success)
        end
        it "renders 'index' template" do
            expect(response).to render_template('index')
        end
    end

    describe 'GET /#show' do
        before(:context) { get user_path[:id] } 
        it 'returns http success' do
            expect(response).to have_http_status(:success)
        end
        it "renders 'show' template" do
            expect(response).to render_template('show')
        end
        it "assigns @user" do
            expect(assigns(:user)).to eq(@user)
        end
        it 'signs in the user' do
            expect(session[:user_id]).to eq(@user.id)
        end
        
    end
end
