class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(params)
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  @post = Post.find(params[:id])
	  @post.update(param_check)
	  redirect_to post_path(@post)
	end

	def edit
	  @post = Post.find(params[:id])
	end
	private
	def param_check
		params.require(:post).permit(:title, :description)
	end

end