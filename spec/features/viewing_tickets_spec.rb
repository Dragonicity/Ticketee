require "rails_helper"

RSpec.feature "Users can view tickets" do
  before do
    project1 = FactoryGirl.create(:project, name: "Website")
    FactoryGirl.create(:ticket, project: project1,
      name: "Ticket name 1",
      description: "Ticket description 1")
  
    project2 = FactoryGirl.create(:project, name: "Application")
    FactoryGirl.create(:ticket, project: project2,
      name: "Ticket name 2",
      description: "Ticket description 2")

    visit "/"
  end

  scenario "for a given project" do
    click_link "Website"

    expect(page).to have_content "Ticket name 1"
    expect(page).to_not have_content "Ticket name 2"

    click_link "Ticket name 1"
    within("#ticket h2") do
      expect(page).to have_content "Ticket name 1"
      expect(page).to_not have_content "Ticket name 2"
    end

    expect(page).to have_content "Ticket description 1"
    expect(page).to_not have_content "Ticket description 2"
  end
end