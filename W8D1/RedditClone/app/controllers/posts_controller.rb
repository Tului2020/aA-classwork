class PostsController < ApplicationController

  before_action :require_logged_in, except: [:show]

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]
 
    if @post.save
      redirect_to sub_post_url(@post.sub_id, @post.id) 
      #  redirect_to "/subs/#{@post.sub_id}/posts/#{@post.id}"
    else
      flash[:errors] = @post.errors.full_messages
      render :new
    end

  end

  def new
    @post = Post.new
    render :new
  end

  def edit
    @post = Post.find_by(id: params[:id])
    if author?(@post)
      render :edit
    else
      flash[:errors] = ['Only the author can edit this post']
      redirect_to sub_post_url(@post.sub_id, @post.id)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def update
    @post = Post.find_by(id: params[:id])

    if author?(@post)
      if @post.update(post_params)
        redirect_to sub_post_url(@post.sub_id, @post.id) 
      else
        flash[:errors] = @post.errors.full_messages
        render :edit
      end
    else
      flash[:errors] = ['Only the author can edit this post']
      render :edit
    end
  end

  def destroy
    
    @post = Post.find_by(id: params[:id])
    if author?(@post)
      redirect_to sub_url(@post.destroy.sub_id)
    else
      flash[:errors] = ['Only the author can delete this post']
      redirect_to sub_post_url(@post.sub_id, @post.id)
    end

  end

  private
  def post_params
    params.require(:post).permit(:title, :url, :content)
  end


end
