class BlogsController < ApplicationController
  before_action :move_to_index, except: [:index]
  def index
    @blogs = Blog.order("created_at DESC")
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(title: blog_params[:title], text: blog_params[:text], user_id: current_user.id)
    redirect_to action: :index
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    Blog.find(params[:id]).update(blog_params)
    redirect_to action: :index
  end

  def destroy
    Blog.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :text)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
