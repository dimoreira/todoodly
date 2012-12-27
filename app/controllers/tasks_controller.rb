class TasksController < ApplicationController
	
	respond_to :html, :xml, :js
	
	def create
		@list = List.find(params[:list_id])
		@task = @list.tasks.new(params[:task])
		if @task.save
			flash[:notice] = 'Task created'
			redirect_to list_path(@list)
		else
			flash[:error] = 'Could not add task'
			redirect_to list_path(@list)
		end
	end
	
	def complete
		@list = List.find(params[:list_id])
		@task = @list.tasks.find(params[:id])
		@task.completed = true
		@task.save
		flash[:notice] = 'Task completed'
		redirect_to list_path(@list)
	end
	
	def sort
		@list = List.find(params[:list_id])
		@tasks = @list.tasks.incomplete
		@tasks.each do |task|
			task.position = params[:task].index(task.id.to_s) + 1
			task.save
		end
		render :nothing => true
	end
end
