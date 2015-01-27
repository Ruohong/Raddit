class CommentsController < ApplicationController
	before_action :all_comments, only: [:index, :create]
	respond_to :html, :js

	def new
		@post=Post.find(params[:post_id])
		@comments=@post.comments
		@comment=Comment.new
	end

	def create
		current_user
		if @current_user && @current_user.editor?
			@post=Post.find(params[:post_id])
			@comments=@post.comments
			@comment=Comment.new(comment_params)
			@comment.user = @current_user
			if @comment.save
	      		flash[:notice] = 'Comment Created'
	      	end
		else
			flash[:alert] = "Sorry You have to Log In First"
		end

		respond_to do |format|
	    	format.html {redirect_to post_comments_path}
	    	format.js
	    end
	end

	def edit
		@comment=Comment.find(params[:id])
	end

	def update
		puts "says its update"
		@comment=Comment.find(params[:id])

		if @comment.update(comment_params)
	      flash[:notice] = 'Comment Edited'
	    end
	    respond_to do |format|
	    	format.html {redirect_to post_comments_path}
	    	format.js
	    end
	end

	def destroy
		@comment=Comment.find(params[:id])
		@post=@comment.post

		current_user
		if @current_user && @current_user.editor? && @current_user.id == @comment.user_id
			 @comment.destroy
			redirect_to post_comments_path(@post)
			alert[:notice] = 'Comment Deleted'
		else
			redirect_to post_comments_path
			alert[:notice] = "Sorry you can't delete this comment"
		end
	end

	private
	def all_comments
		@post=Post.find(params[:post_id])
		@comments=@post.comments
		@comment = Comment.new
	end


	def comment_params
      params.require(:comment).permit(:content, :post_id)
	end
end
