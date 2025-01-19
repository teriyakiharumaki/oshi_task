# frozen_string_literal: true

class SubtasksController < ApplicationController
  before_action :set_user
  before_action :set_task
  before_action :set_subtask, only: %i[show edit update destroy done]

  def index
    @subtasks = @task.subtasks.where(done: false)
    @completed_subtasks = @task.subtasks.where(done: true)
  end

  def show
    @third_tasks = @subtask.third_tasks.where(done: false)
    @completed_third_tasks = @subtask.third_tasks.where(done: true)
  end

  def new
    @subtask = @task.subtasks.new
  end

  def edit; end

  def create
    @subtask = @task.subtasks.new(subtask_params)
    if @subtask.save
      flash[:notice] = ai_comment_message("task_created", @user.oshi_profile)
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def update
    if @subtask.update(subtask_params)
      flash[:notice] = ai_comment_message("task_updated", @user.oshi_profile)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @subtask.destroy
    flash[:notice] = ai_comment_message("task_deleted", @user.oshi_profile)
    redirect_to task_path(@task)
  end

  def done
    if @subtask.done
      @subtask.update(done: false)
      flash[:notice] = ai_comment_message("task_incomplete", @user.oshi_profile)
    else
      @subtask.update(done: true)
      flash[:notice] = ai_comment_message("sub_task_completed", @user.oshi_profile)
    end
    redirect_to task_path(@task)
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_task
    @task = Task.find(params[:task_id])
  end

  def set_subtask
    @subtask = @task.subtasks.find(params[:id])
  end

  def subtask_params
    params.require(:subtask).permit(:title, :body, :done)
  end

  def ai_comment_message(comment_type, oshi_profile)
    return "AIコメントが設定されていません。" unless oshi_profile&.ai_comment

    case comment_type
    when "task_created"
      oshi_profile.ai_comment.task_created_comment
    when "task_updated"
      oshi_profile.ai_comment.task_updated_comment
    when "task_deleted"
      oshi_profile.ai_comment.task_deleted_comment
    when "sub_task_completed"
      oshi_profile.ai_comment.sub_task_completed_comment
    when "task_incomplete"
      oshi_profile.ai_comment.task_incomplete_comment
    else
      "該当するAIコメントが見つかりませんでした。"
    end
  end
end
