class ListsController < ApplicationController

	respond_to :html, :xml, :js
	before_filter :login_required

	def index
		user = current_user
		@lists = user.lists
		respond_with @lists
	end
	
	def new
		@list = List.new
	end
	
	def create
		@list = List.new(params[:list])
		@list.user_id = session[:user_id]
		if @list.save
			flash[:notice] = 'List created.'
			redirect_to list_url(@list)
		else
			flash[:error] = 'Could not create the list'
			redirect_to new_list_url
		end
	end
	
	def show
		begin
			user = current_user
			@list = user.lists.find(params[:id])
			@task = @list.tasks.new
		rescue ActiveRecord::RecordNotFound
			flash[:error] = "No list with id ##{params[:id]}"
			redirect_to lists_path
		end
	end
	
	def edit
		@list = List.find(params[:id])
	end
	
	def update
		@list = List.find(params[:id])
		if @list.update_attributes(params[:list])
			flash[:notice] = 'List updated'
			redirect_to list_path(@list)
		else
			flash[:error] = 'Could not update the list'
			redirect_to edit_list_path(@list)
		end
	end
	
	def destroy
		@list = List.find(params[:id])
		if @list.destroy
			flash[:notice] = 'List deleted'
			redirect_to lists_path
		else
			flash[:error] = 'Could not delete the list'
			redirect_to lists_path
		end
	end
	
	private
	def login_required
		unless current_user
			redirect_to login_path
		end
	end

end
