class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params
		@user.save
		if @user.save
			flash[:notice] = "User created!"
			redirect_to action:'index', controller:'users'
		else
			@errors = @user.errors.full_messages
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
				redirect_to	action: 'index'
				flash[:notice] = "User updated!"
		else
				@errors	=	@visit.errors.full_messages
				render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id]).destroy
		redirect_to action: 'index'
	end

private

	def user_params
		params.require(:user).permit(:user_name, :password, :email)
	end

end
