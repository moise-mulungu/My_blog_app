require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /#index' do
    before(:context) { get post_path }
    it 'is success' do
      expect(response).to have_http_status(:success)
    end
    it "renders 'index' template" do
      expect(response).to render_template('Here is a list of all posts, comments, and likes for a given user')
    end
    it 'renders text with posts' do
      expect(page).to have_text()
    end
  end

  describe 'GET /#show' do
    before(:context) { get post_path }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it "renders 'show' template" do
      expect(response).to render_template(:show)
    end
    it 'renders text with post' do
      expect(page).to have_text('Here is a list of all posts, comments, and likes for a given user')
    end
    
  end
end
