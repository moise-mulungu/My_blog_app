require 'rails_helper'

RSpec.describe 'Testing that user show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Moise', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Developer from Congo.',
                        post_counter: 5)
    visit user_path(@user.id)
  end

  it 'Shows users names.' do
    expect(page).to have_content(@user.name)
  end

  it "Shows the user's photo" do
    expect(page.first('img')['src']).to have_content 'https://unsplash.com/photos/F_-0BxGuVvo'
  end

  it 'Shows the number of posts each user has written' do
    expect(page).to have_content('Number of post: 5')
  end

  it 'Shows the number of posts each user has written' do
    expect(current_path).to eq user_path(@user.id)
  end
  it "Shows the user's bio" do
    expect(page).to have_content('Developer from Congo.')
  end
  it "Shows the user's first three posts" do
    expect(page).to have_content(@user.post_counter)
    expect(page).to have_content(@user.post_counter)
    expect(page).to have_content(@user.post_counter)
  end
  it 'shows the button to see all posts' do
    expect(page).to have_content('See all posts')
  end
end
