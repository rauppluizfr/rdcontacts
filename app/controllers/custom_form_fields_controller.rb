class CustomFormFieldsController < ApplicationController
  load_and_authorize_resource :custom_form_field, :except => [:create]

  def index
    @fields = current_user.custom_form_fields
  end

  def new
    @field = custom_form_field_class.new
  end

  def create
    @field = custom_form_field_class.new(fields_params)
    @field.user = current_user
    authorize! :create, @field
    @field.save
  end

  private

    def custom_form_field
        CustomFormField.forms_type.include?(params[:type]) ? params[:type] : "CustomFormField"
    end

    def custom_form_field_class
        custom_form_field.constantize
    end

    def fields_params
      params.require(custom_form_field.underscore.to_sym).permit(:name,:type)
    end

end
