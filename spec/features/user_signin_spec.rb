feature "Signing in" do
  # background do
  #   User.create(:email => 'jane.buzzlightyear@gmail.com', :password => '12345678')
  # end

  scenario "Signing in with correct credentials" do
    visit '/locations'
    within(".userbar") do
      fill_in 'Email', :with => 'jane.buzzlightyear@gmail.com'
      fill_in 'Password', :with => '12345678'
    end
    click_button 'Sign in'
    expect(page).to have_content 'Welcome Jane'
  end

  # given(:other_user) { User.create(:email => 'bentarenne@gmail.com', :password => '12345678') }

  # scenario "Signing in as another user" do
  #   visit '/sessions/new'
  #   within("#session") do
  #     fill_in 'Email', :with => other_user.email
  #     fill_in 'Password', :with => other_user.password
  #   end
  #   click_button 'Sign in'
  #   expect(page).to have_content 'Invalid email or password'
  # end
end