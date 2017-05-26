class BlogsController < ApplicationController
 before_action :set_blog, only: [:edit, :update, :destroy]
 
 def index
  @blogs = Blog.all
 end

 def new
  @blog = Blog.new
 end

 def create
#  Blog.create(blogs_params)
  @blog=Blog.new(blogs_params)
   if @blog.save
      redirect_to blogs_path, notice:"ブログを作成しました！"
   else
      render action: 'new'
   end 
 end
 
  def update
   #@blogs.find(params[:id])
   @blog = Blog.find(params[:id])
   #@blogs.update(blogs_params)
   if @blog.update(blogs_params)
     redirect_to blogs_path, notice:"ブログを更新しました!"
     #redirect_to blogs_path, notice:"ブログを編集しました!"
   else
     render action: 'edit'
   end
  end
  
  def edit
   @blog = Blog.find(params[:id])
  end
 
 def destroy
   @blog.find(params[:id])
   @blog.destroy
   redirect_to blogs_path, notice:"ブログを削除しました！"
 end
 
 private
  def blogs_params
   params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
   @blog = Blog.find(params[:id])
  end
end

#SQL実行コマンド：　sudo service postgresql start
#achiveディレクトリ移動：cd achieve
#Webサーバ起動コマンド：rails s -b $IP -p $PORT