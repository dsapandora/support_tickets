json.extract! response, :id, :message, :user_id, :ticket_id, :created_at, :updated_at
json.url response_url(response, format: :json)
