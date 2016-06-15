require "rails_helper"

RSpec.feature "Users can sign in" do 
  let!(:user) { FactoryGirl.create(:user) }

  scenario "with valid credentials do" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: user.email
    fill_in "user_password", with: "password"
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{user.email}"
  end
end