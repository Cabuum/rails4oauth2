class SessionsController < ApplicationController

	def create
		auth = request.env["omniauth.auth"]
		user = User.find(provider: auth["provider"], uid: auth["uid"]) || User.create_with_omniauth(auth)
		session[:user_id] = user.id
		session[:access_token] = auth["credentials"]["token"]
		redirect_to root_url
	end

	def destroy
		session[:user_id] = nil
		session[:access_token] = nil
		redirect_to root_url
	end

end