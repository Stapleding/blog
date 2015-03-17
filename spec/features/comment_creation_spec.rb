require 'rails_helper'

feature 'comment creation on posts' do

  background do
    @new_post = create(:post)
  end

  context 'commenter logged in' do

    background do
      commenter = create(:commenter)
    end

    scenario 'adds a new comment' do

      visit posts_path
      click_link @new_post.title
      click_link "Reply"

  

    end
  end
end