class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  belongs_to :role
  before_create :default_role

  private
  def default_role
    self.role ||= Role.find_by_name('customer')
  end
end
