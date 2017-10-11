class UsersController < ApplicationController
	before_action :authenticate_user! 
  	after_action :verify_authorized

	def index
		@users = User.all
		authorize @users
		puts @users
		render :json => @users
	end

	def create
		@user = User.new(user_params)
		authorize @user
		if @user.save
			render :json => @user, status: 200
		else
			render :json => @user.errors, status: :unprocessable_entity
		end
	end


	def show
		@user = User.find(params[:id])
		authorize @user
		render :json => @user
	end

	def update
		@user = User.find(params[:id])
		authorize @user
		if @user.update_attributes(update_user_params)
			#return update
			render :json => @user, status: 200
		else
			#unable to update user
			render :json => @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		user = User.find(params[:id])
		user.destroy
	end

	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
		end

		def update_user_params
			params.require(:user).permit(:name, :email, :role)
		end
		

end