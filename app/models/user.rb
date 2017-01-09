class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  belongs_to :role

  def confirmation_required?
    false
  end

end
