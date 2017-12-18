class ContactsController < ApplicationController
  def index
    respond_to do |format|
      format.json do
        contacts = Contact.select('id, name')
                     .order(name: :asc)
                     .named_like(params[:term])
        render json: { contacts: contacts }.to_json
      end
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end
end
