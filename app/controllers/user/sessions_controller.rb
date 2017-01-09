class User::SessionsController < DeviseTokenAuth::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first

    @resource = nil
    if field
      q_value = resource_params[field]

      if resource_class.case_insensitive_keys.include?(field)
        q_value.downcase!
      end

      q = "#{field.to_s} = ? AND provider='email'"

      if ActiveRecord::Base.connection.adapter_name.downcase.starts_with? 'mysql'
        q = "BINARY " + q
      end

      @resource = resource_class.where(q, q_value).first
    end

    if @resource and valid_params?(field, q_value) and @resource.valid_password?(resource_params[:password]) and (!@resource.respond_to?(:active_for_authentication?) or @resource.active_for_authentication?)
      # create client id
      @client_id = SecureRandom.urlsafe_base64(nil, false)
      @token     = SecureRandom.urlsafe_base64(nil, false)

      @resource.tokens[@client_id] = {
        token: BCrypt::Password.create(@token),
        expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i
      }
      @resource.save
      sign_in(:user, @resource, store: false, bypass: false)

      yield @resource if block_given?
      render_create_success
    elsif @resource and not (!@resource.respond_to?(:active_for_authentication?) or @resource.active_for_authentication?)
      render_create_error_not_confirmed
    else
      render_create_error_bad_credentials
    end
  end

  def render_create_success
    render json: {
      data: resource_data(resource_json: { user: @resource, token: @resource.tokens[@client_id], client: @client_id  })
    }
  end

  # DELETE /resource/sign_out
  def destroy
    # remove auth instance variables so that after_action does not run
    user = User.find_by_uid(params.require(:session)[:uid])
    client_id = params.require(:session)[:client]
    if user.present? && client_id.present? && user.tokens[client_id].present?
      user.tokens.delete(client_id)
      user.save!

      yield user if block_given?

      render_destroy_success
    else
      render_destroy_error
    end
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   params.require(:session).permit(:email, :password)
  # end
end
