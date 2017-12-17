require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  ContactRecord = Struct.new(:name, :email)

  describe "GET /contacts" do
    it 'returns contacts with a name matching a search term' do
      term = 'Blog'
      allow(Contact)
        .to receive(:named_like)
        .with(term)
        .and_return(
          [ ContactRecord.new('Joe Bloggs', 'joe@example.com') ])
      get contacts_index_path, xhr: true, params: { term: term }
      expect(response).to have_http_status(:success)
      json = JSON.parse(response.body)['contacts'][0]
      expect(json["email"]).to eq "joe@example.com"
    end
  end
end
