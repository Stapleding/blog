require 'rails_helper'
include LoginMacros

feature 'comment creation on posts' do


  background do
    @new_post = create(:post)
  end

  context 'commenter logged in' do

    background do
      commenter = create(:commenter)
      commenter_sign_in(commenter)
    end

    scenario 'adds a new comment' do

      visit posts_path
      click_link @new_post.title
      fill_in 'Body', with: 'A brand new comment'
      click_button 'Create Comment'
      expect(current_path).to eq(post_path(@new_post))
      expect(page).to have_content('A brand new comment')
  

    end
  end

  context 'admin logged in' do
    background do
      admin = create(:admin)
      sign_in(admin)
    end

    scenario 'adds a new comment' do
      visit post_path(@new_post)
      fill_in 'Body', with: 'Admins can comment too!'
      click_button 'Create Comment'
      expect(current_path).to eq(post_path(@new_post))
      expect(page).to have_content('Admins can comment too!')
    end
  end
end
