class BlogsController < ApplicationController
 def index
  if params[:user_id]
    @user = User.find(params[:user_id])
    @blogs = @user.blogs.order(created_at: :desc)
  elsif params[:diet_id]
    @diet = Diet.find(params[:diet_id])
    @blogs = @diet.blogs
  else
    @blogs = Blog.all
  end

  end

def new
  if params[:diet_id].present?
    @diet = Diet.find(params[:diet_id])
    @blog = @diet.blogs.new
  else
    @blog = Blog.new
  end
end

  def show
    @blog = Blog.find(params[:id])
  end

def create
  if params[:diet_id].present?
    @diet = Diet.find(params[:diet_id])
    @blog = @diet.blogs.new(blog_parameter)
  else
    @blog = Blog.new(blog_parameter)
  end

  if @blog.save
    redirect_to blog_path(@blog), notice: '投稿を作成しました。'
  else
    render :new
  end
end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end

end
