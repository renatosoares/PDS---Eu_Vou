class CommentsController < ApplicationController
  before_action :authenticate_user!, only:  [:edit, :update, :destroy, :create]
  before_action :set_property, only: [:edit, :update, :destroy]
  before_action :set_comment, only: [:show]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.order(data: :desc)
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = current_user.comments.build
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.data = DateTime.now;
    current_user.point_of_comment
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.event, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
        format.js
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @comment.data = DateTime.now;
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment.event, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @comment.event, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
      format.js 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:conteudo, :data, :user_id, :event_id)
    end

    def set_property
      @comment = current_user.comments.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        redirect_to @comment.event, notice: 'Você não tem permissão para isso.'
    end
end
