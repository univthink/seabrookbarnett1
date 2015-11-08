class WelcomeController < ApplicationController
  def index
    @posts = Post.all
    render template: "layouts/index.html.erb"
  end

  def about
    render template: "layouts/about.html.erb"
  end

  def contact
    render template: "layouts/contact.html.erb"
  end

  def post
    render template: "layouts/post.html.erb"
  end

  def application
    render template: "layouts/application.html.erb"
  end

  def show
    @post = Post.find(params[:id])
    render template: "post/post"
    @post.save
  end

  def new
    @post = Post.new
    render template: "post/new"
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to home_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render template: "post/new"
    @post.save
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
    @post = Post.find(params[:id])
    @post.destroy
    Post.all
    redirect_to home_path
    @post.save
  end
  def all
    @posts = Post.all
    render template: "post/all"
  end
end
