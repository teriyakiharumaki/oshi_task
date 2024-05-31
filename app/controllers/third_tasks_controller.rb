# frozen_string_literal: true

class ThirdTasksController < ApplicationController
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
      flash[:notice] = 'タスク作成したよ！がんばろ！'
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :new
    end
  end

  def update
    if @third_task.update(third_task_params)
      flash[:notice] = 'タスク更新したよ！がんばろ！'
      redirect_to task_subtask_path(@subtask.task, @subtask)
    else
      render :edit
    end
  end

  def destroy
    @third_task.destroy
    flash[:notice] = 'タスクを削除したよ！'
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  def done
    if @third_task.done
      @third_task.update(done: false)
      flash[:notice] = 'もう一回頑張ろう！'
    else
      @third_task.update(done: true)
      flash[:notice] = 'タスク完了だね！'
    end
    redirect_to task_subtask_path(@subtask.task, @subtask)
  end

  private

  def set_subtask
    @subtask = Subtask.find(params[:subtask_id])
  end

  def set_third_task
    @third_task = @subtask.third_tasks.find(params[:id])
  end

  def third_task_params
    params.require(:third_task).permit(:title, :body, :done)
  end
end
