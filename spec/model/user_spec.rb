# require 'rails_helper'

# RSpec.describe User, type: :model do
#   author = User.new(name: 'John Doe', photo: 'https://example.com/photo.jpg',
# bio: 'he was born in 1990 in England', post_counter: 15)

#   before { author.save }

#   it 'is valid with valid attributes' do
#     expect(author).to be_valid
#   end

#   it 'is not valid without a name' do
#     author.name = nil
#     expect(author).to_not be_valid
#   end

#   it 'is not valid without a photo' do
#     author.photo = nil
#     expect(author).to_not be_valid
#   end

#   it 'is not valid without a bio' do
#     author.bio = nil
#     expect(author).to_not be_valid
#   end

#   it 'is not valid without a post_counter' do
#     author.post_counter = nil
#     expect(author).to_not be_valid
#   end

#   it 'is not valid with a post_counter less than 0' do
#     author.post_counter = -1
#     expect(author).to_not be_valid
#   end

#   it 'is recent_posts' do
#     expect(author.recent_posts).to be_a(ActiveRecord::Relation)
#   end
#   it 'has recent_posts with 3 posts' do
#     expect(author.recent_posts.count).to_not eq(3)
#   end
# end

# RSpec.describe Post, type: :model do
#   describe 'Validations for the post model' do
#     before(:each) do
#       @user = User.new(name: 'Tom', bio: 'I am a developer', posts_counter: 0)
#       @post = Post.new(author: @user, title: 'This is a post', text: 'This is a post text',
# likes_counter: 0, comment_counter: 0)
#     end
#   end
# end
