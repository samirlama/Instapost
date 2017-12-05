class CommentsController < ApplicationController
	before_action :authenticate_user!, only: :create
	def create
		@posts = Post.find(params[:post_id])
		@comments = @posts.comments.create(comment_params.merge(:user_id current_user.id))
		if @comments.valid?
			redirect_to root_path
		end	
	end	
	private
	def comment_params
		params.require(:comment).permit(:text,:post_id)
	end	

end
