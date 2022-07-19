require 'rails_helper'

RSpec.describe 'Testing that user show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer.',
                        post_counter: 3)

    @post = Post.create(title: 'First post', text: 'This is my first post', comment_counter: 2, likes_counter: 0,
                        author: @user)

    @comment = Comment.create(text: 'Keep it up!', author: User.first, post: Post.first)

    visit user_posts_path(user_id: @user.id)
  end

  it 'Shows post title.' do
    expect(page).to have_content (@post.title)
  end

  it 'Show post name' do
    expect(page).to have_content (@post.author.name)
  end

  it 'Show the number of posts each user has written' do
    expect(page).to have_content @user.post_counter
  end

  it 'Show how many comments a post has.' do
    expect(page).to have_content (@post.comment_counter = 2)
  end

  it 'Show how many likes a post has.' do
    post = Post.first
    expect(page).to have_content post.likes_counter
  end

  it 'can see the username of each commentor.' do
    post = Post.first
    comment = post.comments.first
    expect(page).to have_content(comment.author.name)
  end

  it 'can see the comments of each commentor.' do
    expect(page).to have_content 'Keep it up!'
  end
end
