require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it "renders users index view" do
      expect(response).to render_template(:index)
    end
    it 'shows content in the view' do
      expect(response.body).to include('Here is a list of all posts, comments, and likes for a given user')
    end
  end

  describe 'GET /show' do
    before(:context) { get 'users/1' }
  
    it 'is success' do
      expect(response).to have_http_status(:success)
    end
    it "renders users show view" do
      expect(response).to render_template(show:) 
    end
    it 'shows content in the view' do
      expect(response.body).to include('Here is a list of all posts, comments, and likes for a given user')
    end
  end
end
