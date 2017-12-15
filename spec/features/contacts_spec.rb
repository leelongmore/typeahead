require 'rails_helper'
require 'select2_helper'

include Select2Helper

RSpec.feature "Contacts", type: :feature, js: :true do
  scenario "user searches for a contact" do
    pending "ajax (remote data) not yet implemented"
    contact_1 = FactoryBot.create(:contact, name: 'Joe Bloggs')
    contact_2 = FactoryBot.create(:contact, name: 'Fred Smith')

    visit root_path
    select2 'Joe', 'Joe Bloggs'

    expect(page).to have_current_path "/contacts/#{contact_1.to_param}"
    expect(page).to have_content 'joe@example.com'
  end
end
