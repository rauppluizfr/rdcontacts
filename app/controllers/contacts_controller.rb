class ContactsController < ApplicationController

  load_and_authorize_resource :contact, :except => [:create]

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    if params[:email]

      @contact = Contact.new(contacts_params)
      @contact.user = current_user
      email = params[:email]
      user_contact = User.where(email: email).first
      user_contact = User.create!(name: @contact.name, email: email) if user_contact.nil?

      @contact.contact = user_contact
      authorize! :create, @contact
      @contact.save
    end
  end

private

  def contacts_params
    params.require("contact").permit(:name)
  end

end
