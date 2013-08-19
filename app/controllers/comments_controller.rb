class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new
    @comment.recommendation = params[:recommendation]
    @comment.trip_detail_id = params[:trip_detail_id]
    @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to :back
    else
      render 'new'
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.recommendation = params[:recommendation]
    @comment.trip_detail_id = params[:trip_detail_id]
    @comment.user_id = params[:user_id]

    if @comment.save
      redirect_to trips_url
    else
      render 'new'
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.destroy
    redirect_to :back
  end
end
