require 'web_helpers'

feature 'login' do

  scenario 'user can log in' do
    new_user = User.create(username: 'test_name')
    visit '/sessions/new'
    fill_in(:username, with: 'test_name')
    click_button('Log in')

    expect(current_path).to eq "/user"
    expect(page).to have_content 'test_name logged in'
  end

  # scenario 'user can log out' do
  #   'test'
  # end

end