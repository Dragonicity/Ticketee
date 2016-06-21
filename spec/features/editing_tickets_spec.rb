require "rails_helper"

RSpec.feature "Users can edit existing tickets" do
  let(:author)  { FactoryGirl.create(:user) }
  let(:project) {FactoryGirl.create(:project)}
  let(:ticket)  {FactoryGirl.create(:ticket, project: project, author: author)}

  before do
    assign_role!(author, :editor, project)
    login_as(author)
    visit project_ticket_path(project, ticket)
    click_link "Edit Ticket"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Updated ticket name"
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has been updated."

    within("#ticket h2") do
      expect(page).to have_content "Updated ticket name"
      expect(page).not_to have_content ticket.name
    end
  end

  scenario "with invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Ticket"

    expect(page).to have_content "Ticket has not been updated."
  end
end