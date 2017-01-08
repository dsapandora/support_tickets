class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :status
  has_many :responses
  scope :closed_this_month, -> { where('created_at > ? AND created_at < ? AND status_id = ?', Time.now.beginning_of_month, Time.now.end_of_month, Status.find_by_name('closed')) }
end
