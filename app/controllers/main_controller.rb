class MainController < ApplicationController

	def home
		if current_user
			redirect_to lists_path
		end
	end

end
