class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def set_user_by_token(mapping=nil)
    # determine target authentication class
    #gets the headers names, which was set in the initialize file
    uid_name = DeviseTokenAuth.headers_names[:'uid']
    access_token_name = DeviseTokenAuth.headers_names[:'access-token']
    client_name = DeviseTokenAuth.headers_names[:'client']

    # parse header for values necessary for authentication
    uid        = request.headers[uid_name] || params[uid_name]
    @token     ||= request.headers[access_token_name] || params[access_token_name]
    @client_id ||= request.headers[client_name] || params[client_name]

    # client_id isn't required, set to 'default' if absent
    @client_id ||= 'default'
    user = User.find_by_uid(uid)
    if user.present? && @client_id.present? && user.tokens[@client_id].present?
      @current_user = user
    end
  end
end
