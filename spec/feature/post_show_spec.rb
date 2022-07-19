require 'rails_helper'

RSpec.describe 'Testing that user show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.', post_counter: 3)

    @post = Post.create(title: 'First post', text: 'This is my first post', comment_counter: 0, likes_counter: 0, author: @user)
    @comment = Comment.create(text: 'Keep it up!', author: User.first, post: Post.first)

    visit user_post_path(user_id: @post.author_id, id: @post.id)
  end

  it 'shows post title' do
    expect(page).to have_content @post.title
  end

  it 'shows who wrote the post' do
    expect(page).to have_content @post.author.name
  end

  it 'shows how many comments a post has' do
    expect(page).to have_content @post.comment_counter
  end

  it 'shows how many likes a post has' do
    expect(page).to have_content @post.likes_counter
  end

  it 'shows post body' do
    expect(page).to have_content @post.text
  end

  it 'shows user name of each comment' do
    post = Post.first
    comment = post.comments.first
    expect(page).to have_content comment.author.name
  end

  it 'shows the comment each commenter left' do
    post = Post.first
    comment = post.comments.first
    expect(page).to have_content comment.text
  end
end
