class Api::ListsController < ApplicationController

	respond_to :json, :xml

	def index
		@lists = List.all
		@response = {}
		
		if @lists.empty?
			@response = {
				error: true,
				message: 'No lists available',
				data: ''
			}
		else
			@response = {
				error: false,
				message: 'Lists',
				data: @lists
			}
		end
		
		respond_with @response
	end
	
	def show
		begin
			@list = List.find(params[:id])
			@response = {
				error: false,
				message: "List: #{@list.name}",
				data: @list
			}
		rescue ActiveRecord::RecordNotFound
			@response = {
				error: true,
				message: "No list found",
				data: ""
			}
		end
		
		respond_with @response
	end

end
