require "rails_helper"

RSpec.feature "Users can view project list" do
  scenario "with the project details" do
    project = FactoryGirl.create(:project, name: "Website")

    visit "/"
    click_link "Website"
    expect(page.current_url).to eq project_url(project)
  end
end