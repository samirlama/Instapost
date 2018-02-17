class PostsController < ApplicationController
	before_action :authenticate_user!, only:[:new,:create] 
	before_action :is_owner? , only: [:edit , :update , :destroy]
	def create
			@posts = current_user.posts.create(post_params)
			if @posts.valid?
				redirect_to posts_path
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
	def destroy
		@posts = Post.find(params[:id])
		if @posts.destroy
			redirect_to root_path
		end	
	end	
	def show
		@posts = Post.find(params[:id])
		end
	end	
	
	private
	 def is_owner?
	 	redirect_to root_path if Post.find(params[:id]).user != current_user
	 end	

	def post_params
  		params.require(:post).permit(:user_id, :photo, :description)
	end


