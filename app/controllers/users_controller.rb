class UsersController < ApplicationController

	before_action :my_user, only: [:show, :edit, :update]
	#before_action :check_user, only: [:create, :edit, :update, :destroy]

	def index
		@users = User.all
	end

	def show
	end

	def user_profile
		@current_userr = current_user
	end
=begin
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
	end
=end

	def edit
	end

	def update
		# byebug
		if @user
			@user.update(user_params)
      redirect_to user_profile_path
    else
      render :edit, status: :unprocessable_entity
    end
	end

	private

	def user_params
		params.require(:user).permit(:role, :name, :contact, :image, :email) 
	end

	def my_user
		@user = User.find(current_user.id)
	end

  #def check_user
	#	render json: {errors: "you are not authorized to perform this action."} and return unless current_user.role == 'author'
	#end
end
