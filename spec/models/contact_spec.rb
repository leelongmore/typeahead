require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "finding by name" do
    before do
      @joe = FactoryBot.create(:contact, name: 'Joe Bloggs')
    end

    it 'returns contacts matching a search term' do
      ben = FactoryBot.create(:contact, name: 'Ben Blower')
      FactoryBot.create(:contact, name: 'Fred Smith')
      matches = Contact.named_like('Blo')
      expect(matches.size).to eq(2)
      expect(matches).to include(@joe, ben)
    end

    it 'returns an empty collection if no matches' do
      matches = Contact.named_like('Foo')
      expect(matches).to be_empty
    end

    # SQLite is case-insensitive by default
    it 'is case-insensitive' do
      matches = Contact.named_like('blo')
      expect(matches.size).to eq(1)
      expect(matches).to include(@joe)
    end

    it 'ignores leading and trailing spaces in the search term' do
      matches = Contact.named_like(' blo ')
      expect(matches.size).to eq(1)
      expect(matches).to include(@joe)
    end
  end

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
