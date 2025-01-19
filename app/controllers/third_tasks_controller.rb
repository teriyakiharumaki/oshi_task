# frozen_string_literal: true

class ThirdTasksController < ApplicationController
  before_action :set_user
  before_action :set_subtask
  before_action :set_third_task, only: %i[show edit update destroy done]

  def show; end

  def new
    @third_task = @subtask.third_tasks.new
  end

  def edit; end

  def create
    @third_task = @subtask.third_tasks.new(third_task_params)
    if @third_task.save
      flash[:notice] = ai_comment_message("task_created", @user.oshi_profile)
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :new
    end
  end

  def update
    if @third_task.update(third_task_params)
      flash[:notice] = ai_comment_message("task_updated", @user.oshi_profile)
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :edit
    end
  end

  def destroy
    @third_task.destroy
    flash[:notice] = ai_comment_message("task_deleted", @user.oshi_profile)
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  def done
    if @third_task.done
      @third_task.update(done: false)
      flash[:notice] = ai_comment_message("task_incomplete", @user.oshi_profile)
    else
      @third_task.update(done: true)
      flash[:notice] = ai_comment_message("sub_task_completed", @user.oshi_profile)
    end
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def set_subtask
    @subtask = Subtask.find(params[:subtask_id])
  end

  def set_third_task
    @third_task = @subtask.third_tasks.find(params[:id])
  end

  def third_task_params
    params.require(:third_task).permit(:title, :body, :done)
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
