module Api
    module V1
      class BlogsController < ApplicationController
        before_action :set_blog, only: [:show, :update, :destroy]
  
        def index
byebug
          blogs = Blog.order(created_at: :desc)
          render json: { status: 'SUCCESS', message: 'Loaded blogs', data: blogs }
        end
  
        def show
          render json: { status: 'SUCCESS', message: 'Loaded the blog', data: @blog }
        end
  
        def create
          blog = Blog.new(blog_params)
          if blog.save
            render json: { status: 'SUCCESS', data: blog }
          else
            render json: { status: 'ERROR', data: blog.errors }
          end
        end
  
        def destroy
          @blog.destroy
          render json: { status: 'SUCCESS', message: 'Deleted the blog', data: @blog }
        end
  
        def update
          if @blog.update(blog_params)
            render json: { status: 'SUCCESS', message: 'Updated the blog', data: @blog }
          else
            render json: { status: 'SUCCESS', message: 'Not updated', data: @blog.errors }
          end
        end
  
        private
  
        def set_blog
          @blog = Blog.find(params[:id])
        end
  
        def blog_params
          params.require(:blog).permit(:title)
        end
      end
    end
  end