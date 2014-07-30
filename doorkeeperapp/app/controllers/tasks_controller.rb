class TasksController < ApplicationController
	
	before_filter :authorize, only: :create

	def index
		
	end

	def create
		current_user.tasks.create!(tasks_params)
		redirect_to tasks_url
	end

private
	def tasks_params
		params.require(:task).permit :name
	end
end