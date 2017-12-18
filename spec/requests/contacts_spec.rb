require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  ContactRecord = Struct.new(:id, :name, :email)

  before do
    @record = ContactRecord.new('1', 'Joe Bloggs', 'joe@example.com')
  end

  describe "GET /contacts" do
    it 'returns contacts with a name matching a search term' do
      term = 'Blog'
      allow(Contact)
        .to receive(:named_like)
        .with(term)
        .and_return([ @record ])
      get contacts_index_path, xhr: true, params: { term: term }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)['contacts'][0]
      expect(json["name"]).to eq "Joe Bloggs"
    end
  end

  describe "GET /contacts/:id" do
    context "when a contact exists for a given id" do
      it "displays the contact" do
        allow(Contact)
          .to receive(:find)
          .with('1')
          .and_return(@record)
        get contact_path('1')
        expect(response).to have_http_status(:success)
        expect(response.body).to include('joe@example.com')
      end
    end
  end
end
