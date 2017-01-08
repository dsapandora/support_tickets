class Ticket < ApplicationRecord
  belongs_to :user
  before_create :default_status

  private
  def default_status
    self.status ||= Status.find_by_name('open')
  end
end
