require 'pg'

feature 'Homepage' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Welcome to Gerking\'s Bookmark Manager'
  end

  scenario 'Bookmarks appear on startup' do
    visit('/')
    expect(page).to have_content 'https://www.youtube.com'
    expect(page).to have_content 'https://www.google.com'
    expect(page).to have_content 'https://www.makersacademy.com'
  end

  scenario 'New bookmarks should be added' do
    visit('/')
    fill_in 'bookmark', with: 'https://www.msnnews.co.uk'
    click_button 'Enscribe'
    expect(page).to have_content 'https://www.msnnews.co.uk'
  end

  scenario 'Does not allow an invalid url to be added' do
    visit('/')
    fill_in 'bookmark', with: 'https:|/www.bbc.co.uk/news'
    click_button 'Enscribe'
    expect(page).not_to have_content 'https:|/www.bbc.co.uk/news'
  end
end
