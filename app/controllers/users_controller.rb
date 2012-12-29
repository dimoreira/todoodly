class UsersController < ApplicationController

	def index
		@users = User.all
		for user in @users
			@text = user.name
		end
		
		render :text => @text
	end

	def new
		@user = User.new
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to login_path, :notice => "Signed up!"
		else
			render "new"
		end
	end
	
	def login
		
	end
	
	def log_in
		user = User.find_by_email(params[:email])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash[:notice] = 'Logged in!'
			redirect_to root_url
		else
			flash[:error] = 'Invalid email or password'
			redirect_to login_path
		end
	end
	
	def log_out
		session[:user_id] = nil
		flash[:notice] = 'Logged out!'
		redirect_to root_url
	end

end
