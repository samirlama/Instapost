class PostsController < ApplicationController
	before_action :authenticate_user!, only:[new:,:create] 
	def create
			@posts = current_user.posts.create(posts_params)
			if @posts.valid?
				redirect_to root_path
			else
				render :new,status: :unprocessable_entity
			end		
	end	
def new 
@posts = Post.new
end	

private

def post_params
  params.require(:post).permit(:user_id, :photo, :description)
end
end
