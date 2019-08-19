require 'rails_helper.rb'

feature 'Creating Reviews' do
	scenario 'can create review' do
		# visit root route
		visit '/plays/new'
		# click create post link
		click_button 'commit'
		# fill in the form with needed information (title and caption)
		fill_in 'Title', with: 'title'
		fill_in 'Caption', with: 'caption'
		#click submit button
		click_button 'Create Update'
		# expect page to have the content we submitted
		expect(page).to have_content('title')
		expect(page).to have_content('caption')
	end
end
