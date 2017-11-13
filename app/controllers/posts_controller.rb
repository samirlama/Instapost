class PostsController < ApplicationController
	def create
		@posts = Post.create(post_params)
		if @posts.valid?
			redirect_to root_path
	end
	private
	def post_params
		params.require(:post).permit(:photo,:description,:user_id)
	end	
end
