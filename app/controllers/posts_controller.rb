class PostsController < ApplicationController
	def index
		@posts=Post.all
		@categories = Category.all

		respond_to do | format |
			format.html
			format.js
		end
	end

	def new
		current_user
		if @current_user && @current_user.editor?
			@post=Post.new
			@categories = Category.all
		else	
			redirect_to root_url, :alert => "Sorry You have to Log In First"
		end
	end

	def create
		@post=Post.new(post_params)
		@post.user = current_user
		@post.count = 0
	    if @post.save
	      flash[:notice] = 'Post Created'

	      redirect_to posts_path
	    else
	      render 'new'
	    end

	end

	def edit
		@post=Post.find(params[:id])
		current_user
		if @current_user && @current_user.editor?
			if @current_user.id == @post.user_id
				@categories = Category.all
			elsif @current_user.id != @post.user_id
				redirect_to root_url, :alert => "Sorry you are not the creator of this post"
			end
		else
			redirect_to root_url, :alert => "Sorry You have to Log In First"
		end		
	end

	def update
		@post=Post.find(params[:id])


	    if @post.update(post_params)
	      flash[:notice] = 'Post Edited'
	      redirect_to root_url
	    else
	      render 'new'
	    end
	end

	def destroy
		@post = Post.find(params[:id])
		current_user
		if @current_user && @current_user.editor?
			if @current_user.id == @post.user_id
				@post.destroy
				flash[:notice] = "Successfully deleted"
				redirect_to posts_path
			elsif @current_user.id != @post.user_id
				redirect_to root_url, :alert => "Sorry you are not the creator of this post"
			end
		else
			redirect_to root_url, :alert => "Sorry You have to Log In First"
		end		

		
	end


	private
	def post_params
      params.require(:post).permit(:title, :body, {:category_ids => []}, :user_id)
	end


end
