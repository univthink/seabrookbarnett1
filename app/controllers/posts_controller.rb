class PostsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @post = Post.all
    render template: "post/post"
  end

  def show
    @post = Post.find(params[:id])
    render template: "post/post"
    @post.save
  end

  def new
    @posts = Post.all
    @post = Post.new
    render template: "post/new"
  end

  def create
    @posts = Post.all
    @url3 = request.original_url
    if @url3.split('/')[-1] != "new?fname=BroccoliCasserole"
    @post = Post.new(post_params)
    @post.save
    render template: "post/all"
  else
    redirect_to error_path
  end
  end

  def edit
    @post = Post.all
    @url = request.original_url
    @post = Post.find(params[:id])
    if @url.split('/')[-1] == "edit?fname1=BroccoliCasserole"
    render template: "post/new"
    @post.save
    else
    redirect_to error_path
  end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render template: "post/new"
    end
    @post.save
  end

  def destroy
    @url1 = request.original_url
    @post = Post.find(params[:id])
    if @url1.split('/')[-1] == "delete?fname=BroccoliCasserole"
    @post.destroy
    Post.all
    redirect_to home_path
    @post.save
  else
    redirect_to error_path
  end
  end
  def all
    @posts = Post.all
    render template: "post/all"
  end

end
