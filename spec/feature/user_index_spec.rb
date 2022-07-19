require 'rails_helper'

RSpec.describe 'users index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'John', photo:'', bio: 'Chemist from Russia')
    @second_user = User.create(name: 'Jane', photo:'', bio: 'Physicist from Germany')
    @first_user.save
    @second_user.save

    5.times do |i|
      @post = Post.create(title: "Post #{i}", content: "Content #{i}", author_id: @first_user.id, text: This is a text #{i}")
    end
    visit user_path(@first_user)
  end

  describe 'User index page' do
    it 'Shows the username' do
      expect(page).to have_content('Jane')
    end

    it "Shows the user's photo" do
      expect(page).to have_css('.user-image')
    end

    it 'Shows the number of posts' do
      all(:css, '.number_posts').each do |post|
        expect(post).to have_content('Number of posts:')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Signed in successfully.')
      expect(page).to have_content 'Jane'
      expect(page).to have_no_content('See All Posts')
    end
  end
end