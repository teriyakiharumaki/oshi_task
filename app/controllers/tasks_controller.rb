# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_user
  before_action :set_task, only: %i[show edit update destroy done]

  def index
    @tasks = @user.tasks.where(done: false)
    @completed_tasks = @user.tasks.where(done: true)
  end

  def show
    @subtasks = @task.subtasks.where(done: false)
    @completed_subtasks = @task.subtasks.where(done: true)
  end

  def new
    @task = @user.tasks.new
  end

  def edit; end

  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:notice] = ai_comment_message("task_created", @user.oshi_profile)
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = ai_comment_message("task_updated", @user.oshi_profile)
      redirect_to @task
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = ai_comment_message("task_deleted", @user.oshi_profile)
    redirect_to tasks_path
  end

  def done
    if @task.done
      @task.update(done: false)
      flash[:notice] = ai_comment_message("task_incomplete", @user.oshi_profile)
    else
      @task.update(done: true)
      flash[:notice] = ai_comment_message("task_completed", @user.oshi_profile)
    end
    redirect_to tasks_path
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_task
    @task = @user.tasks.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :body, :done)
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
    when "task_completed"
      oshi_profile.ai_comment.task_completed_comment
    when "task_incomplete"
      oshi_profile.ai_comment.task_incomplete_comment
    else
      "該当するAIコメントが見つかりませんでした。"
    end
  end
end
