class UserSessionsController < ApplicationController

	def new
		@user_session = UserSession.new(session)
	end

	def create
		@user_session = UserSession.new(session, params[:user_session])
		if @user_session.authenticate!
			redirect_to root_path, notice: 'logou-se com sucesso!!'
		else 
			redirect_to root_path, :notice => 'dados errados!!'
		end
	end

	def destroy
		@user_session.destroy
		redirect_to root_path, :notice => 'deslogado seu gay mother fuck!!'
	end

end