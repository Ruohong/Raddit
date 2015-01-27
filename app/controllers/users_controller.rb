class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url, :notice => "Signed Up!"
  	else
  		render 'new'
  	end
  end

  def show
    @user= User.find(params[:id])
  end

  def post_show
    @user= User.find(params[:id])
    render "post.js.erb"
  end

  def comment_show
    @user= User.find(params[:id])
    render "comment.js.erb"
  end

  private

  def user_params
  	params.require(:user).permit(:email, :password, :password_confirmation, :user_id)
  end
end
