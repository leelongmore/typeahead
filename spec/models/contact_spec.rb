require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is valid with a name and email' do
    contact = Contact.new(name: 'Fred Smith', email: 'fred@example.com')
    expect(contact).to be_valid
  end

  it 'is invalid without a name' do
    contact = FactoryBot.build(:contact, name: '')
    contact.valid?
    expect(contact.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an email address' do
    contact = FactoryBot.build(:contact, email: '')
    contact.valid?
    expect(contact.errors[:email]).to include("can't be blank")
  end
end
