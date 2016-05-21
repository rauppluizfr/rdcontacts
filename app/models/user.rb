class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

def is_admin?
  false
end

private
  def password_required?
    self.type == 'Client' || self.type == 'Admin'
  end
end
