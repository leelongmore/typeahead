require 'rails_helper'

RSpec.feature "Contacts", type: :feature, js: :true do
  scenario "user searches for a contact" do
    pending "root path not yet implemented"
    contact_1 = FactoryBot.create(:contact, name: 'Joe Bloggs')
    contact_2 = FactoryBot.create(:contact, name: 'Fred Smith')

    visit root_path
    fill_in "Search", with: 'Blog'
    select "Joe Bloggs", from: 'Search results'

    expect(page).to have_current_path "/contacts/#{contact_1.to_param}"
    expect(page).to have_content 'joe@example.com'
  end
end
