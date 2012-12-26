class Api::TasksController < ApplicationController

	respond_to :json, :xml
	
	def index
		@list = List.find(params[:list_id])
		@tasks = @list.tasks
		
		if @tasks.empty?
			@response = {
				error: true,
				message: 'No tasks available',
				data: ''
			}
		else
			@response = {
				error: false,
				message: 'Tasks',
				data: @tasks
			}
		end
		
		respond_with @response
	end
	
	def show
		begin
			@list = List.find(params[:list_id])
			@task = @list.tasks.find(params[:id])
			@response = {
				error: false,
				message: "Task: #{@task.description}",
				data: @task
			}
		rescue ActiveRecord::RecordNotFound
			@response = {
				error: true,
				message: "No task found with this id",
				data: ""
			}
		end
		
		respond_with @response
	end

end
