class PostController < ApplicationController
  before_filter :authenticate_user!
  
  def index
  end

  def new
  	@post = Post.new()
  end

  def create
  	@post = Post.new(params[:post])
    @post.user_id = current_user.id
    logger.info("User: #{@post.user_id} , Current User: #{current_user.id}")

  	@post.save()
    logger.info("User: #{@post.user_id} , : #{current_user.id}")
  	redirect_to show_post_path(@post)
  end

  def show
  	@post = Post.find_by_id(params[:id])
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.destroy

    redirect_to post_list_url
  end

  def list
  	@post = Post.all
  end

end
