class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id]) 
  end

  # POST /comments
  # POST /comments.json
  def create
    @my_thread = MyThread.find(params[:my_thread_id]) 
    @my_thread.comments.create(comment_params)
    redirect_to my_thread_path([@my_thread]) 
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.update(comment_params)
    @my_thread = MyThread.find(params[:my_thread_id]) 
    redirect_to @my_thread
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @my_thread_id = params[:my_thread_id]
    @comment.destroy
    redirect_to my_thread_path(@my_thread_id) 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body, :my_thread_id)
    end
end
