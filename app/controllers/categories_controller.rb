class CategoriesController < ApplicationController
	def show
		@category=Category.find(params[:id])
		@categories=Category.all
		@posts=@category.posts

		respond_to do | format |
			format.html
			format.js
		end
	end

	def index
		@posts=Post.all
		@categories = Category.all
	end
end
