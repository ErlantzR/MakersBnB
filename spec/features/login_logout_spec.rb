require 'web_helpers'

feature 'login' do

  scenario 'user can log in' do
    new_user = User.create(username: 'test_name')
    visit '/sessions/new'
    fill_in(:username, with: 'test_name')
    click_button('Log in')

    expect(current_path).to eq "/spaces"
    expect(page).to have_content 'test_name logged in'
  end

  scenario 'user try to log in with a username not in the database yet' do

    visit 'sessions/new'
    fill_in(:username, with: 'not_created_yet')
    click_button('Log in')
    expect(current_path).to eq '/sessions/new'
  end

  scenario 'user can log out' do
    new_user = User.create(username: 'test_name')
    visit '/sessions/new'
    fill_in(:username, with: 'test_name')
    click_button('Log in')

    expect(current_path).to eq '/spaces'
    expect(page).to have_content 'test_name logged in'
    visit '/'
    expect(page).to have_content "Logged in as test_name"
    visit '/user'

    click_button 'Log out'

    expect(current_path).to eq '/'
    expect(page).not_to have_content "Logged in as test_name"
  end

end