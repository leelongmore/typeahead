require 'rails_helper'
require 'select2_helper'

include Select2Helper

RSpec.feature "Contacts", type: :feature, js: :true do
  scenario "user searches for a contact" do
    joe = FactoryBot.create(
      :contact, name: 'Joe Bloggs', email: 'joe@example.com')
    FactoryBot.create(:contact, name: 'Ben Blower')
    FactoryBot.create(:contact, name: 'Fred Smith')

    visit root_path
    select2 'blo', 'Joe Bloggs'

    expect(page).to have_current_path "/contacts/#{joe.to_param}"
    expect(page).to have_content 'joe@example.com'
  end
end
