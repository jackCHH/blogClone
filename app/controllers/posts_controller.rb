class PostsController < ApplicationController
	def index
		@post = Post.all.order("created_at DESC")
	end

	# let's add the ability to create new posts
	def new
		@post = Post.new
	end


	def create
		# post_param is a safe guard. forgot what it's called.
		@post = Post.new(post_params)
		if @post.save
			#after we save, redirect to the post we just created. that's why it's redirect to @post. 
			redirect_to @post
		else
			# if not save, redirect to a new form submission page
			render "new"
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
			redirect_to @post
		else
			render "edit"
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		# make sure it's not post_path (singular) since we want to see ALL THE POSTS after we delete a post. If we only 
		# use post_path, it will try to redirect to the already deleted post, thus rendering an error
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
