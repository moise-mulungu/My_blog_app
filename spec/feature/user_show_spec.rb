require 'rails _helper'

RSpec.describe 'users show', type: :feature do
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

  it 'should show user' do
    visit user_path(@user)
    expect(page).to have_content(@user.name)
  end

  describe 'user show page' do
    it "Shows the user's photo" do
      expect(page).to have_css('.user-image')
    end

    it 'Shows the username' do
      expect(page).to have_content('John')
    end

    it 'show number of posts per user' do
      expect(page).to have_content(@first_user.posts_counter)
      expect(page).to have_content 'Number of posts: 5'
    end

    it "show user's bio." do
      expect(page).to have_content('Bio:')
      expect(page).to have_content('chemist from Russia.')
    end

    it 'show users first 3 posts.' do
      expect(page).to have_content 'This is my 4 post'
      expect(page).to have_content 'This is my 3 post'
      expect(page).to have_content 'This is my 2 post'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)

      visit user_post_path(@first_user.id, @post.id)
      expect(page).to have_content 'Like'
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@first_user)

      visit user_posts_path(@first_user.id)

      5.times do |i|
        expect(page).to have_content "This is my #{i} post"
      end
    end
  end
end