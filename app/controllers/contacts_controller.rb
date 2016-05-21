class ContactsController < ApplicationController

  load_and_authorize_resource :contact, :except => [:create]

  def index
    @contacts = current_user.contacts
  end

  def new
    @contact = Contact.new
    @contact.user = current_user
    @contact.custom_form_fields << current_user.custom_form_fields
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

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    @contact.update_attributes(contacts_params)
  end

private

  def contacts_params
    params.require("contact").permit(:name,
    :contacts_custom_form_fields_attributes  => [:id,:custom_form_field_id,:value])
  end

end
