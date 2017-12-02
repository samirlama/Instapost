class PostsController < ApplicationController
	before_action :authenticate_user!, only:[:new,:create] 
	def create
			@posts = current_user.posts.create(post_params)
			if @posts.valid?
				redirect_to root_path
			else
				render :new,status: :unprocessable_entity
			end		
	end	
	def index
		@posts = Post.all.order('created_at DESC')
	end	
	def new 
	@posts = Post.new
	end	
	def edit
		@posts = Post.find(params[:id])
	end	
	def update
		@posts = Post.find(params[:id])
		@posts.update(post_params)
		if @posts.valid?
			redirect_to root_path
		else
			render :edit , :status , :unprocessable_entity
		end		
	end	

	private

	def post_params
  		params.require(:post).permit(:user_id, :photo, :description)
	end
end
