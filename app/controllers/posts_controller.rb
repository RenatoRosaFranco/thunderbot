# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.order(created_at: :desc)
                 .page(params[:page])
                 .per(12)
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end