require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  before do
    sign_up_correct_helper
  end

  scenario 'There is a like button for every post' do
      create_post("I want to like this post")
      create_post("I want to like this post as well")
      expect(find('div#1.post-div')).to have_selector('input#like-button')
      expect(find('div#2.post-div')).to have_selector('input#like-button')
  end

  scenario 'There is a like count for every post' do
    create_post("I want to like this post")
    expect(find('div#1.post-div')).to have_selector('p#like-count')
  end

  scenario 'When the user likes a post, the like count increases by one' do
    create_post("I want to like this post")
    click_on('Like')
    save_and_open_page
    expect(find('p#like-count')).to have_content('1👍')
  end
end
