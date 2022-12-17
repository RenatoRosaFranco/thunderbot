# frozen_string_literal: true

module Dashboard
  class PostsController < HomeController
    before_action :set_post, only: [:show, :edit, :update, :destroy]

    def index
      @posts = Post.order(created_at: :desc)
                   .page(params[:page])
                   .per(12)
    end

    def new
      @post = Post.new
    end

    def show
    end

    def create
      post = Post.new(post_params)

      if post.save
        redirect_to dashboard_post_path(post), notice: 'Post criado com sucesso.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @post.update(post_params)
        redirect_to dashboard_post_path(@post), notice: 'Post atualizado com sucesso.'
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to dashboard_posts_path, notice: 'Post removido com sucesso.'
    end

    private

    def post_params
      params.require(:post)
        .permit()
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end
  end
end