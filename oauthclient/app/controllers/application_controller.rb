class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from OAuth2::Error do |exception|
  	if exception.responde.status == 401
  		session[:user_id] = nil
  		session[:access_token] = nil
  		redirect_to root_url, notice: 'Token de acesso expirado'
  	end
  end

private

	def oauth_client
		@oauth_client ||= OAuth2::Client.new(ENV["OAUTH_ID"], ENV["OAUTH_SECRET"], site: "http://localhost:3000")
	end

	def access_token
		if session[:access_token]
			@access_token ||= OAuth2::AccessToken.new(oauth_client, sessio[:access_token])
		end
	end

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	helper_method :current_user

end
