class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :check_password

  has_many :custom_form_fields
  has_many :contacts

  def self.user_type
    %w(Admin Client)
  end

  def is_admin?
    false
  end

  def is_client?
    false
  end

  def check_password
    #we should send an e-mail to the user to inform the new password
    self.password = 12345678 if new_record? and password_required? and password.nil?
    true
  end

private
  def password_required?
    self.type == 'Client' || self.type == 'Admin'
  end
end
