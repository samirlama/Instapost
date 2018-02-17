class FollowsController < ApplicationController
	def create
		@following = User.find(params[:user_id])

		#@follower = current_user.id
		#binding.pry
		@followed =current_user.follow(@following)
		if @followed
			redirect_to request.referrer

		end	
	end
	def destroy
		@following = User.find(params[:user_id])
		
		@unfollowed = current_user.stop_following(@following)
		if @unfollowed
			redirect_to request.referrer
		end	

		
	end	
end
