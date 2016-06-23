require "rails_helper"

RSpec.feature "Admins can manage a user's roles" do 
  let(:admin)         { FactoryGirl.create(:user, :admin) }
  let(:user)          { FactoryGirl.create(:user) }
  let!(:website)      { FactoryGirl.create(:project, name: "Website") }
  let!(:application)  { FactoryGirl.create(:project, name: "Application") }

  before do
    login_as(admin)
  end

  scenario "when assinging roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Viewer",  from: "Website"
    select "Manager", from: "Application"

    click_button "Update User"
    expect(page).to have_content "User has been updated"

    click_link user.email
    expect(page).to have_content "Website: Viewer"
    expect(page).to have_content "Application: Manager"
  end
end