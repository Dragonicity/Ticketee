require "rails_helper"

RSpec.feature "Users can view project list" do
  let(:user)    { FactoryGirl.create(:user) }
  let(:project) { FactoryGirl.create(:project, name: "Website") }

  before do
    login_as(user)
    assign_role!(user, :viewer, project)
  end

  scenario "with the project details" do
    visit "/"
    click_link "Website"
    expect(page.current_url).to eq project_url(project)
  end
end