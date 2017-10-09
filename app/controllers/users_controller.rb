class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		#authorize User
	end

	def show
		@user = User.find(params[:id])

	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			#return update
		else
			#unable to update user
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
	end

	private

		def user_params
			params.requrie(:user).permit(:role)
		end
		

end