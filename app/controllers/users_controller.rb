class UsersController < ApplicationController
	def show
		@users = User.find(params[:id])
		@follow = Follow.where(followable_id: @users.id, follower_id: current_user.id)
	end	

end
