class VotesController < ApplicationController

  def up
    vote(1)

    respond_to do | format |
      format.html
      format.js
    end
  end

  def down
    vote(-1)

    respond_to do | format |
      format.html
      format.js
    end
  end

  private
  def vote(arrow_direction)
    current_user
    @post = Post.find(params[:id])

    @vote=Vote.new
    @vote.user_id = @current_user.id
    @vote.post_id = params[:id]

    puts arrow_direction

     if @vote.save
        @post.count = @post.count + arrow_direction
      @post.save
    end

  end

end
