require 'rails_helper'

RSpec.describe 'Post', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'John', photo:'', bio: 'Chemist from Russia')
    
    @first_user.save

    5.times do |i|
      @post = Post.create(title: "Post #{i}", content: "Content #{i}", author_id: @first_user.id, text: This is a text #{i}")
    end
    visit user_path(@first_user)
  end

  describe 'Post show page' do
    it "should show post's title" do
      expect(page).to have_content 'Hello'
    end

    it "should show post's author" do
      expect(page).to have_content @first_user.name
      expect(page).to have_content 'John'
    end

    it 'should show the number of comments' do
      expect(page).to have_content(@post.comments_counter)

      comment = Comment.all
      expect(comment.size).to eql(5)
    end

    it 'should show the number of likes' do
      expect(page).to have_content(@post.likes_counter)

      like = Like.all
      expect(like.size).to eql(1)
    end

    it 'should show the post body' do
      expect(page).to have_content 'This is my first post'
    end

    it 'can see the username of each commentor.' do
      comment = @post.comments.first
      expect(page).to have_content(comment.author.name)
    end

    it 'should show the text comment each commentor' do
      expect(page).to have_content 'comment0'
      expect(page).to have_content 'comment1'
      expect(page).to have_content 'comment2'
      expect(page).to have_content 'comment3'
      expect(page).to have_content 'comment4'
    end
  end
end