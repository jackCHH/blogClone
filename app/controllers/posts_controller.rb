class PostsController < ApplicationController
	def index
		@post = Post.all.order("created_at DESC")
	end

	# let's add the ability to create new posts
	def new

	end


	def create
		# post_param is a safe guard. forgot what it's called.
		@post = Post.new(post_params)
		@post.save
		#after we save, redirect to the post we just created. that's why it's redirect to @post. 
		redirect_to @post
	end

	def show
		@post = Post.find(params[:id])
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
